class Api::V1::StatisticsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User

  def create
    string = params[:content]
    analyzed_string = IBMToneAnalyzer::Tones.analyze_tone(string)
    tones = analyzed_string["document_tone"]["tones"]

    # @statistic = Statistic.new(tones_stat)
    # @statistic.kid = current_user.kids.first
    # Each stat would be assigned to the correct user kid, unfortunately a user has many kids...
    # Can the Kid take their parents email and then have a unique api key?
    # authorize @statistic
    if !bad_tweet?(tones) && !bad_dictionary?(string)
      render_false
    elsif bad_tweet?(tones) || bad_dictionary?(string)
      render_true
    else
      render_error
    end
  end

  private

  def bad_tweet?(tweets)
    tweets.each do |tweet|
      if tweet[:tone_id] == "anger" && tweet[:score] > 0.5
        true
      elsif tweet[:tone_id] == "sadness" && tweet[:score] > 0.5
        true
      elsif tweet[:tone_id] == "fear" && tweet[:score] > 0.5
        true
      else
        false
      end
    end
  end

  def bad_dictionary?(content)
    word_array = content.split.map do |word|
      current_user.kids.first.dictionary.words.includes?(word)
    end
    word_array.any?(true)
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
    render json: { errors: @statistic.errors.full_messages }, status: :unprocessable_entity
  end
end
