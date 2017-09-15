require 'rspec'
require 'word'

describe 'Word' do
    describe '.list' do
        it "starts empty" do
            expect(Word.list()).to(eq([]))
        end
        it "creates list of words" do
            word1 = Word.new("foo")
            word1.save
            word2 = Word.new("bar")
            word2.save
            expect(Word.list()).to(eq([word1, word2]))
        end
    end
end