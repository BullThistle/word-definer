class Word
    @@list = []

    attr_accessor :word
    def initialize(word)
        @word = word
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
end