require "json"
require "ibm_watson"
require "ibm_watson/authenticators"
require "ibm_watson/tone_analyzer_v3"
require_relative "../models/statistic.rb"

json = File.open("./example_analysis.json")
# temporarily needed until we complete scraping mechanisms #
weets = JSON.parse(json.read)
twats = weets["utterances_tone"].map do |tweet|
  tweet["tones"]
end
p tweets = twats.flatten
    # --------------------------------- #
    Statistic.create(
      total_tweets: tweets.count,
      angry_tweets: tweets.count { |tweet| tweet["tone_id"] == "angry" },
      sad_tweets: tweets.count { |tweet| tweet["tone_id"] == "sad" },
      joyful_tweets: tweets.count { |tweet| tweet["tone_id"] == "joy" },
      fearful_tweets: tweets.count { |tweet| tweet["tone_id"] == "fear" },
      analytical_tweets: tweets.count { |tweet| tweet["tone_id"] == "analytical" },
      tentative_tweets: tweets.count { |tweet| tweet["tone_id"] == "tentative" },
      confident_tweets: tweets.count { |tweet| tweet["tone_id"] == "confident" }
    )


    [
        {
          "score": 0.79513,
          "tone_id": "impolite",
          "tone_name": "Impolite"
        },
        {
          "score": 0.647368,
          "tone_id": "sad",
          "tone_name": "Sad"
        },
        {
          "score": 0.67376,
          "tone_id": "excited",
          "tone_name": "Excited"
        },
        {
          "score": 0.722718,
          "tone_id": "satisfied",
          "tone_name": "Satisfied"
        }
      ]
      ]
