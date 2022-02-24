string = "Get fucked you idiot, go and dig a hole."

def bad_dictionary?(string)
  bad_words = %w[fucked shit poop]
  word_array = string.split.map do |word|
    # if current_user.kids.first.dictionary.words.includes?(word)
    bad_words.include?(word)
  end
  p word_array.any?(true)
end

bad_dictionary?(string)

# words array needs to be check if there are any TRUE FALSE cases and then the tweet is rendered or not.
# tweets = [
#       {
#         "score": 0.685309,
#         "tone_id": "anger",
#         "tone_name": "Anger"
#       },
#       {
#         "score": 0.568183,
#         "tone_id": "fear",
#         "tone_name": "Fear"
#       },
#       {
#         "score": 0.724923,
#         "tone_id": "confident",
#         "tone_name": "Confident"
#       }
#     ]

# def bad_tweet?(tweets)
#   # If an angry tweet has a score of 0.75 or higher(or whatever our user.kids has assigned (enumeberable?)), it is bad
#   tweets.each do |tweet|
#     if tweet[:tone_id] == "anger" && tweet[:score] > 0.5
#       puts "this is an angry tweet"
#     elsif tweet[:tone_id] == "sadness" && tweet[:score] > 0.5
#       puts "this is a sad tweet"
#     elsif tweet[:tone_id] == "fear" && tweet[:score] > 0.5
#       puts "this is a fearful tweet"
#     else
#       puts "this tweet is an OK tweet"
#     end
#   end
# end
# bad_tweet?(tweets)
# This here is OK! It might need to be refactored, but otherwise it can determine what is OK and what is NOT.
