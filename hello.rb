require_relative 'caesar_cipher.rb'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
  if request.query_string =~ /input=\w+&shift=\d+/
    shift = params['shift']
    sentence = params['input']
    encrypted = caesar_cipher(sentence, shift.to_i)
  else
    encrypted = 'correct input not found'
  end
  erb :index, :locals => {:encrypted => encrypted}
  #"#{request.query_string}"
end

def first_word(sentence)
  sentence.split[0]
end

def not_first_word(sentence)
  sentence.split[1..-1].join(' ')
end

