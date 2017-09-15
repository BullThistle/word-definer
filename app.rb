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
    word = Word.new(word_in)
    word.save
    @list = Word.list
    erb :list
end

get('/items/:id') do
    @word = Word.find(params[:id])
    erb(:item)
end
