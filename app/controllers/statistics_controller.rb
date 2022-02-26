class StatisticsController < ApplicationController
  def create
    tones = [
      {
        "score": 0.685309,
        "tone_id": "anger",
        "tone_name": "Anger"
      },
      {
        "score": 0.568183,
        "tone_id": "fear",
        "tone_name": "Fear"
      },
      {
        "score": 0.724923,
        "tone_id": "confident",
        "tone_name": "Confident"
      }
    ]
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


tones = [
  {
    "score": 0.685309,
    "tone_id": "anger",
    "tone_name": "Anger"
  },
  {
    "score": 0.568183,
    "tone_id": "fear",
    "tone_name": "Fear"
  },
  {
    "score": 0.724923,
    "tone_id": "confident",
    "tone_name": "Confident"
  }
]
@statistic = Statistic.new
authorize @statistic
# tweettones = tones.map do |tone|
#   [tone[:tone_name], tone[:score]]
# end
tweet_scores = tones.map { |tone| tone[:score] }
selected_tone = tones.select { |tone| tone[:score] == tweet_scores.max }
tone = selected_tone[0][:tone_id]
@statistic.tone = tone
