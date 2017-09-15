require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require './lib/word'
require 'pry'

get '/' do
    @list = Word.list
    erb :list
end

post '/' do
    @list = Word.list
    word_in = params['word']
    definition = params['definition']
    word = Word.new(word_in, definition)
    @flag = 0
    @list.each do |wordcheck|
        if wordcheck.word == word.word
            @flag = 1
        end
    end
    if @flag == 0
        word.save
    end
    @list = Word.list
    erb :list
end

get '/word/:id' do
    @word = Word.find(params[:id])
    erb :word
end