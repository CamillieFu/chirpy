# frozen_string_literal: true
require "json"
require "ibm_watson"
require "ibm_watson/authenticators"
require "ibm_watson/tone_analyzer_v3"

# If using IAM
# authenticator = IBMWatson::Authenticators::IamAuthenticator.new(
#   apikey: ""
# )

# If you have username & password in your credentials use:
# authenticator = IBMWatson::Authenticators::BasicAuthenticator.new(
#   username: "{username}",
#   password: "{password}"
# )

# tone_analyzer = IBMWatson::ToneAnalyzerV3.new(
#   authenticator: authenticator,
#   version: "2017-09-21"
# )
# tone_analyzer.service_url = ""

# utterances = [
#   {
#     "text" => "I am very happy.",
#     "user" => "glenn"
#   },
#   {
#     "text" => "It is a good day.",
#     "user" => "glenn"
#   }
# ]
# p "\ntone_chat example 1:\n"
# puts JSON.pretty_generate(tone_analyzer.tone_chat(utterances: utterances).result)

# p "\ntone example 1:\n"
# puts JSON.pretty_generate(tone_analyzer.tone(
#   tone_input: "I am very happy. It is a good day.",
#   content_type: "text/plain"
# ).result)

# p "\ntone example 2:\n"
# File.open(Dir.getwd + "/tone-example.json") do |tone_json|
#   tone = tone_analyzer.tone(
#     tone_input: JSON.parse(tone_json.read)["text"],
#     content_type: "text/plain"
#   ).result
#   puts JSON.pretty_generate(tone)
# end

# p "\ntone example 3:\n"
# File.open(Dir.getwd + "/tone-example.json") do |tone_json|
#   tone = tone_analyzer.tone(
#     tone_input: JSON.parse(tone_json.read)["text"],
#     content_type: "text/plain",
#     sentences: true
#   ).result
#   puts JSON.pretty_generate(tone)
# end

# File.open("./fake_texts.json") do |tone_json|
#   tone = tone_analyzer.tone_chat(
#     tone_input: JSON.parse(tone_json.read),
#     content_type: "application/json"
#   ).result
#   puts JSON.pretty_generate(tone)
# end

# tweets = File.open("./fake_texts.json")
# puts JSON.pretty_generate(tone_analyzer.tone_chat(utterances: tweets).result)

# p "\ntone example 5:\n"
# tweets = File.open("./example_analysis.json")
# all = JSON.parse(tweets.read)

# twats = all["utterances_tone"].map do |tweet|
#   tweet["tones"]
# end
# wats = twats.flatten
# lewats = wats.map do |t|
#   t["tone_id"]
# end
# p wats.count { |tweet| tweet["tone_id"] == "sad" }
# p all_tweets = JSON.parse(tweets)

File.open("./fake_texts.json") do |tone_html|
  tweets = JSON.parse(tone_html.read)['tweets']
  tweets.each do |tweet|
    tone = tone_analyzer.tone(
      tone_input: tweet["text"],
      content_type: "text/html"
    ).result
    p tone["document_tone"]["tones"]
  end
end
