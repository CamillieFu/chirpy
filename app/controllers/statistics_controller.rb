class StatisticsController < ApplicationController
  def create
    @statistic = Statistic.new
    authorize @statistic
    tweet_scores = tones.map { |tone| tone[:score] }
    selected_tone = tones.select { |tone| tone[:score] == tweet_scores.max }
    tone = selected_tone[0][:tone_id]
    @statistic.tone = tone
    @statistic.kid = current_user.kids.first
    @statistic.save
    # how to change it so that it selects the highest score OR the negative affect with the highest score?
    # currently it is only the highest score regardless of affect
  end
end
