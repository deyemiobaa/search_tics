module StopwordsCheck
  def end_with_stop_word?(query)
    stop_words = File.read("#{Rails.root}/lib/stop_words.json")

    word = query.downcase.strip.split(' ').last

    low = 0
    high = stop_words.length - 1
    while low <= high
      mid = (low + high) / 2
      if stop_words[mid] == word
        return true
      elsif stop_words[mid] < word
        low = mid + 1
      else
        high = mid - 1
      end
    end

    false
  end
end