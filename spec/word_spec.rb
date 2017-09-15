require 'rspec'
require 'word'

describe 'Word' do

    before do
        Word.empty
    end

    describe '.list' do
        it "starts empty" do
            expect(Word.list).to(eq([]))
        end
        it "creates list of words" do
            word1 = Word.new("foo", "bar")
            word1.save
            word2 = Word.new("bar", "foo")
            word2.save
            expect(Word.list).to(eq([word1, word2]))
        end
    end

    describe '.empty' do
        it "empties the word list" do
            word = Word.new("foo", "bar")
            word.save
            Word.empty
            expect(Word.list).to(eq([]))
        end
    end

    describe '.find' do
        it "finds a word based on its id" do
            word1 = Word.new("foo", "bar")
            word1.save
            word2 = Word.new("bar", "foo")
            word2.save
            expect(Word.find(1)).to(eq(word1))
            expect(Word.find(2)).to(eq(word2))
        end
    end
end