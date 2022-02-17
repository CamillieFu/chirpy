json.extract! statistic, :total_tweets, :angry_tweets, :sad_tweets, :fearful_tweets, :kid_id
json.kids @statistic.kids do |kid|
  json.extract! kid, :id, :first_name, :last_name, :age
end
