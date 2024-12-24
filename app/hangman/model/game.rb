class Hangman
  module Model
    class Game
      attr_accessor :word_to_guess, :guess
      
      def initialize
        restart
      end
      
      def restart
        self.word_to_guess = 'MAGNIFICANT'
        self.guess = ' ' * self.word_to_guess.size
      end
    end
  end
end
