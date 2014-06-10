class WordCloud
  def initialize(data)
    @data = data
  end

  def hashify
    result = {}

    @data.each do |person, phrases|
      phrases.each do |phrase|
        words = phrase.downcase.scan(/\w+/)
        words.each do |word|
          if result[word]
            result[word] = {
              :count => (result[word][:count] += 1),
              :people => (result[word][:people] << person)
            }
          else
            result[word] = {
              :count => 1,
              :people => [ person ]
            }
          end
        end
      end
    end
    result
  end
end