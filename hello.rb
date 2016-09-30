require_relative 'caesar_cipher.rb'
require 'sinatra'
#require 'sinatra/reloader'

get '/' do
  to_encrypt = params['input']
  if request.query_string =~ /input=\d+\+.+/
    shift = first_word(to_encrypt)
    sentence = not_first_word(to_encrypt)
    encrypted = caesar_cipher(sentence, shift.to_i)
  else
    encrypted = 'correct input not found, please try again'
  end
  erb :index, :locals => {:encrypted => encrypted}
end

def first_word(sentence)
  sentence.split[0]
end

def not_first_word(sentence)
  sentence.split[1..-1].join(' ')
end

