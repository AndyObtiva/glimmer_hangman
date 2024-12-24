class Hangman
  module Model
    class Game
      attr_accessor :word, :guess
      
      def initialize
        restart
      end
      
      def restart
        self.word = 'MAGNIFICANT'
        self.guess = ' ' * self.word.size
      end
    end
  end
end
