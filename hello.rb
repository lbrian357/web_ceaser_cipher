require_relative 'caesar_cipher.rb'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
  to_encrypt = params['input']
  shift = first_word(to_encrypt).to_i
  sentence = not_first_word(to_encrypt)
  encrypted = caesar_cipher(sentence, shift)
  erb :index, :locals => {:encrypted => encrypted}
end

def first_word(sentence)
  sentence.split[0]
end

def not_first_word(sentence)
  sentence.split[1..-1].join(' ')
end

