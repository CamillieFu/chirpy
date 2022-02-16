require "json"
require "ibm_watson"
require "ibm_watson/authenticators"
require "ibm_watson/tone_analyzer_v3"

class IBMToneAnalyzer::Tones
  def self.analyze_tone(json)
    authenticator = IBMWatson::Authenticators::IamAuthenticator.new(
      apikey: ENV["TONE_ANALYZER_APIKEY"]
    )

    tone_analyzer = IBMWatson::ToneAnalyzerV3.new(
      authenticator: authenticator,
      version: "2017-09-21"
    )
    tone_analyzer.service_url = ENV["TONE_ANALYZER_URL"]

    # tweets = JSON.parse(json)['tweets']
    # tweets.each do |tweet|
    #   tone = tone_analyzer.tone(
    #   tone_input: tweet["text"],
    #   content_type: "text/html"
    # ).result
    # p tone["document_tone"]["tones"]
    # end

  # tone_analyzer.tone(tone_input: text, content_type: "text/plain").result["document_tone"]["tones"][0]

  # needed File.open just becuz we dont have twitter data yet
    # File.open("./fake_texts.json") do |tone_html|
    #   tweets = JSON.parse(tone_html.read)['tweets']
    #   tweets.each do |tweet|
    #     tone = tone_analyzer.tone(
    #       tone_input: tweet["text"],
    #       content_type: "text/html"
    #     ).result
    #     tone["document_tone"]["tones"]
        # do we need to save this data in a variable? or perhaps do map instead of each?
        # what data type does this return? if we make it return an array of hashes that might be good
      end
    end
  end
end
