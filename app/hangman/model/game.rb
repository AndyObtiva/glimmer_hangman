class Hangman
  module Model
    class Game
      WORDS_FILE_PATH = File.join(APP_ROOT, './config/words.txt')
    
      attr_accessor :word, :guess, :incorrect_guess_count
      
      def initialize
        load_words
        restart
      end
      
      def restart
        self.word = select_random_word
        self.guess = ' ' * self.word.size
        self.incorrect_guess_count = 0
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
        else
          self.incorrect_guess_count += 1
        end
      end
      
      private
      
      def load_words
        @words = File.read(WORDS_FILE_PATH).lines.map(&:chomp).map(&:downcase)
      end
      
      def select_random_word
        shuffle_word_indexes if @word_indexes.nil? || @word_indexes.empty?
        word_index = @word_indexes.pop
        @words[word_index]
      end
      
      def shuffle_word_indexes
        @word_indexes = @words.size.times.to_a.shuffle
      end
    end
  end
end
