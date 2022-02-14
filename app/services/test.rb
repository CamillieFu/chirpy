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
