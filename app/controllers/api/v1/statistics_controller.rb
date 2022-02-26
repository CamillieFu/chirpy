class Api::V1::StatisticsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User

  def create
    string = params[:content]
    analyzed_string = IBMToneAnalyzer::Tones.analyze_tone(string)
    tones = analyzed_string["document_tone"]["tones"]
    make_stat(tones)
    if !bad_tweet?(tones) && !bad_dictionary?(string)
      render_false
    elsif bad_tweet?(tones) || bad_dictionary?(string)
      render_true
    else
      render_error
    end
  end

  private

  def make_stat(tones)
    @statistic = Statistic.new
    authorize @statistic
    tweet_scores = tones.map { |tone| tone["score"] }
    selected_tone = tones.select { |tone| tone["score"] == tweet_scores.max }
    if selected_tone == []
      @statistic.tone = "unverified"
    else
      tone = selected_tone[0]["tone_id"]
      @statistic.tone = tone
    end
    @statistic.kid = current_user.kids.first
    @statistic.save
  end

  def bad_tweet?(tweets)
    tone_array = tweets.map do |tweet|
      if tweet["tone_id"] == "anger" && tweet["score"] > 0.5
        true
      elsif tweet["tone_id"] == "sadness" && tweet["score"] > 0.5
        true
      elsif tweet["tone_id"] == "fear" && tweet["score"] > 0.5
        true
      else
        false
      end
    end
    tone_array.any?(true)
  end

  def bad_dictionary?(content)
    kids_dictionary = current_user.kids.first.dictionary.words.map(&:upcase)
    word_array = content.upcase.split.map do |word|
      kids_dictionary.include?(word)
    end
    word_array.any?(true)
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
