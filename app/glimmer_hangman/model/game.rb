class GlimmerHangman
  module Model
    class Game
      WORDS_FILE_PATH = File.join(APP_ROOT, './config/words.txt')
    
      attr_accessor :word, :guess, :guessed_letters, :incorrect_guess_count
      
      def initialize
        load_words
        restart
      end
      
      def restart
        self.word = select_random_word
        self.guess = ' ' * self.word.size
        self.incorrect_guess_count = 0
        self.guessed_letters = []
      end
      
      def guess_letter(letter)
        letter = letter.to_s.downcase
        return if guessed_letters.include?(letter) || won? || lost?
        guessed_letters << letter
        if correct_guess_letter?(letter)
          update_guess_with_newly_guessed_letter(letter)
        else
          self.incorrect_guess_count += 1
        end
      end
      
      def guessed_letter_at_index?(letter_index)
        guess[letter_index] != ' '
      end
      
      def correct_guess_letter?(letter)
        word.include?(letter)
      end
      
      def won?
        guess.chars.count(' ') == 0
      end
      
      def lost?
        incorrect_guess_count >= word.size
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
      
      def update_guess_with_newly_guessed_letter(letter)
        letter_indexes = word.chars.each_with_index.select {|c, i| c == letter }.map(&:last)
        new_guess = guess.dup
        letter_indexes.each { |letter_index| new_guess[letter_index] = letter }
        self.guess = new_guess
      end
    end
  end
end
