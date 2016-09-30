def caesar_cipher(sentence, shift)
  while shift < 0
    shift = shift + 26
  end #to change all negative values to positive
  array_of_alphabet = ('a'..'z').to_a
  alpha_key = {}
  i = 1

  while i <= array_of_alphabet.length do 
    alpha_key[array_of_alphabet[i-1]] = i 
    i+=1
  end #creates hash of alphabets to number starting from a => 1
  encrypted_letters = []
  arr_of_letters = sentence.split('')
  arr_of_letters.each do |letter|
    
    if array_of_alphabet.include?(letter) #handles downcase letters
      
      shifted_number = alpha_key[letter]+shift
      while shifted_number > 26
        shifted_number = shifted_number - 26
      end
      encrypted_letters.push alpha_key.invert[shifted_number] 

    elsif array_of_alphabet.include?(letter.downcase)
      
      shifted_number = alpha_key[letter.downcase]+shift
      while shifted_number > 26
        shifted_number = shifted_number - 26
      end

      encrypted_letters.push alpha_key.invert[shifted_number].upcase 

    else
      encrypted_letters.push letter
    end
  end
  encrypted_letters.join('')
end
