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

    # utterances = [
    #   {
    #     "text" => text
    #   }
    # ]
    # tone_analyzer.tone_chat(utterances: utterances).result["utterances_tone"][0]["tones"]
    tweets = JSON.parse(json)['tweets']
    tweets.each do |tweet|
      tone = tone_analyzer.tone(
      tone_input: tweet["text"],
      content_type: "text/html"
    ).result
    p tone["document_tone"]["tones"]
    end
  end
end