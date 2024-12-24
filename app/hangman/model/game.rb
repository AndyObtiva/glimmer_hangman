class Hangman
  module Model
    class Game
      attr_accessor :word_to_guess
      
      def initialize
        restart
      end
      
      def restart
        self.word_to_guess = 'MAGNIFICANT'
      end
    end
  end
end
