class Api::V1::StatisticsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User

  def create
    string = params[:content]
    analyzed_string = IBMToneAnalyzer::Tones.analyze_tone(string)
    tones = analyzed_string["document_tone"]["tones"]
    # Above create returns the JSON from the IBM method

    @statistic = Statistic.new(tones_stat)
    @statistic.kid = current_user.kids.first
    # Each stat would be assigned to the correct user kid, unfortunately a user has many kids...
    # Can the Kid take their parents email and then have a unique api key?
    authorize @statistic
    if !bad_tweet?(tones) && @statistic.save
      render :false_show, status: :created
      # render false_show is there for explanation of what this is doing
      # In our render we could pass simple boolean true or false based on the existence of an angry tweet
      # Could we use enumberable for User for the score filter? 0.25, 0.5, 0.75 for angry, sad and fearful?
    elsif bad_tweet?(tones) && @statistic.save
      render :true_show, status: :created
      # In our render we could pass simple boolean true or false based on the existence of an angry tweet
      # Could we use enumberable for User for the score filter? 0.25, 0.5, 0.75 for angry, sad and fearful?
    else
      render_error
    end
  end


  # def create
  #   parsed_json_string = JSON.parse(json)
  #   # Change the json to a string. Do we have to make it into a JSON to send it to Chirpy Webapp from extension?
  #   analyzed_json = IBMToneAnalyzer::Tones.analyze_tone(parsed_json_string)
  #   # This sends the data(needs to be a string) to analyzer
  #   @analyzed_json = File.open(analyzed_json)
  #   file = JSON.parse(@analyzed_json.read)

  #   twat = file["sentence_tone"].map do |tweet|
  #     tweet["tones"]
  #   end
  #   @tweets = twat.flatten
  #   @statistic = Statistic.new(tweet_stats)
  #   @statistic.kid = current_user.kid
  #   # Each stat would be assigned to the correct user kid
  #   authorize @statistic
  #   if !bad_tweet?(@statistic) && @statistic.save
  #     render :false_show, status: :created
  #     # render false_show is there for explanation of what this is doing
  #     # In our render we could pass simple boolean true or false based on the existence of an angry tweet
  #     # Could we use enumberable for User for the score filter? 0.25, 0.5, 0.75 for angry, sad and fearful?
  #   elsif bad_tweet?(@statistic) && @statistic.save
  #     render :true_show, status: :created
  #     # In our render we could pass simple boolean true or false based on the existence of an angry tweet
  #     # Could we use enumberable for User for the score filter? 0.25, 0.5, 0.75 for angry, sad and fearful?
  #   else
  #     render_error
  #   end
  # end


  private

  def bad_tweet?(tweet)
    # If an angry tweet has a score of 0.75 or higher(or whatever our user.kids has assigned (enumeberable?)), it is bad
  end

  def tones_stat
    # Only be taking in one tweet at a time so got rid of the array total
    {
      angry_tweets: @tweets.count { |tweet| tweet["tone_id"] == "angry" },
      sad_tweets: @tweets.count { |tweet| tweet["tone_id"] == "sad" },
      joyful_tweets: @tweets.count { |tweet| tweet["tone_id"] == "joy" },
      fearful_tweets: @tweets.count { |tweet| tweet["tone_id"] == "fear" },
      analytical_tweets: @tweets.count { |tweet| tweet["tone_id"] == "analytical" },
      tentative_tweets: @tweets.count { |tweet| tweet["tone_id"] == "tentative" },
      confident_tweets: @tweets.count { |tweet| tweet["tone_id"] == "confident" }
    }
  end

  def set_statistic
    @statistic = Statistic.find(params[:id])
    authorize @statistic  # For Pundit
  end

  def statistic_params
    params.require(:statistic).permit(:text)
  end

  def render_true
    render json: { bad: "true" }, status: :created
  end

  def render_false
    render json: { bad: "false" }, status: :created
  end

  def render_error
    render json: { errors: @statistic.errors.full_messages },
      status: :unprocessable_entity
  end
end
