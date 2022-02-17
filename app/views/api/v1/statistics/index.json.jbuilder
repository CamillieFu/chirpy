json.array! @statistics do |statistic|
  json.extract! statistic, :total_tweets, :angry_tweets, :sad_tweets, :fearful_tweets, :kid_id
end
