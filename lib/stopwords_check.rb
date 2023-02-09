
require 'json'

module StopwordsCheck
  def is_stop_word?(word)
    stop_words_file = File.read("#{Rails.root}/lib/stop_words.json")
    stop_words = JSON.parse(stop_words_file).sort

    low = 0
    high = stop_words.length
    while low <= high
      mid = (low + (high - low) / 2).floor
      if stop_words[mid] == word
        return true
      elsif stop_words[mid] > word
        high = mid
      else
        low = mid + 1
      end
    end

    false
  end
end