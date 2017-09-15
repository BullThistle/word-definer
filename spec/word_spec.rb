require 'rspec'
require 'word'

describe 'Word' do
    describe '.list' do
        it "starts empty" do
            expect(Word.list()).to(eq([]))
        end
    end
end