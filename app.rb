require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require './lib/word'

get '/' do
    @list = Word.list
    erb :list
end

post '/' do
    word_in = params['word']
    definition = params['definition']
    word = Word.new(word_in, definition)
    word.save
    @list = Word.list
    erb :list
end

get '/word/:id' do
    @word = Word.find(params[:id])
    erb :word
end