class Word
    @@list = []

    attr_reader :id
    attr_accessor :word, :definition
    def initialize(word, definition)
        @word = word
        @definition = definition
        @id = @@list.length + 1
    end

    def save
        @@list.push(self)
    end

    def self.list
        @@list
    end

    def self.empty
        @@list = []
    end

    def self.find(id)
        word_id = id.to_i
        @@list.each do |word|
          if word.id == word_id
            return word
          end
        end
      end
end