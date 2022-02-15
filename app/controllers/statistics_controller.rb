class StatisticsController < ApplicationController
  def create(json)
    @json = File.open(json)
    # temporarily needed until we complete scraping mechanisms #
    file = JSON.parse(@json.read)
    twats = file["utterances_tone"].map do |tweet|
      tweet["tones"]
    end
    @tweets = twats.flatten
    @statistic = Statistic.new(tweet_stats)
    @statistic.kid = current_user # not sure about this
    # --------------------------------- #
    @statistic.save
  end

  private

  def tweet_stats
    {
      total_tweets: @tweets.count,
      angry_tweets: @tweets.count { |tweet| tweet["tone_id"] == "angry" },
      sad_tweets: @tweets.count { |tweet| tweet["tone_id"] == "sad" },
      joyful_tweets: @tweets.count { |tweet| tweet["tone_id"] == "joy" },
      fearful_tweets: @tweets.count { |tweet| tweet["tone_id"] == "fear" },
      analytical_tweets: @tweets.count { |tweet| tweet["tone_id"] == "analytical" },
      tentative_tweets: @tweets.count { |tweet| tweet["tone_id"] == "tentative" },
      confident_tweets: @tweets.count { |tweet| tweet["tone_id"] == "confident" }
    }
  end
end
