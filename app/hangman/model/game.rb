class Hangman
  module Model
    class Game
      attr_accessor :word, :guess
      
      def initialize
        restart
      end
      
      def restart
        self.word = 'magnificent'
        self.guess = ' ' * self.word.size
      end
      
      def guess_letter(letter)
        letter = letter.to_s.downcase
        if word.include?(letter)
          letter_indexes = word.chars.each_with_index.select {|c, i| c == letter }.map(&:last)
          new_guess = guess.dup
          letter_indexes.each do |letter_index|
            new_guess[letter_index] = letter
          end
          self.guess = new_guess
        end
      end
    end
  end
end
