
string = "@shiiiikno\n·\nFeb 21\nI HATE being mad at the people i love.. life is so short!\n9\n3,927\n9,865"
tones = [{ "score": 0.832471, "tone_id": "confident", "tone_name": "Confident" } ]

  def bad_tweet?(tweets)
    tone_array = tweets.map do |tweet|
      if tweet["tone_id"] == "anger" && tweet["score"] > 0.5
        true
      elsif tweet["tone_id"] == "sadness" && tweet["score"] > 0.5
        true
      elsif tweet["tone_id"] == "fear" && tweet["score"] > 0.5
        true
      else
        false
      end
    end
    tone_array.any?(true)
  end


  p bad_tweet?(tones)



  def bad_dictionary?(content)
    array = ["hate"]
    kids_dictionary = array.map(&:upcase)
    word_array = content.upcase.split.map do |word|
      kids_dictionary.include?(word)
    end
    word_array.any?(true)
  end

  p bad_dictionary?(string)


  if !bad_tweet?(tones) && !bad_dictionary?(string)
      puts "good"
    elsif bad_tweet?(tones) || bad_dictionary?(string)
      puts "bad"
  end
