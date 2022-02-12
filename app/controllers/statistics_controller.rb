class StatisticsController < ApplicationController
  # may not need but just made it for now
  def calculate_angy_stats(json)
    json.reject { |tweet| tweet["score"] > 0.5 && tweet["tone_id"] == "angry" }
  end
end
