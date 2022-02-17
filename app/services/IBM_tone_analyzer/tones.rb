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
    tone_analyzer.tone(tone_input: text, content_type: "text/plain").result["document_tone"]["tones"][0]
  end
end
