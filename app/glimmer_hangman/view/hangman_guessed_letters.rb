require 'glimmer_hangman/model/game'

class GlimmerHangman
  module View
    class HangmanGuessedLetters
      include Glimmer::LibUI::CustomShape
    
      option :game
      option :size, default: 480
      option :thickness, default: 2
      option :font_size, default: 17
      
      body {
        text(size*0.1, size*0.9, size*0.8) {
          default_font family: 'Courier New', size: font_size
          
          content(game, :guessed_letters) do
            game.guessed_letters.each do |letter|
              string(letter.upcase) {
                color string_color(letter)
              }
              string(' ')
            end
          end
        }
      }
      
      private
      
      def string_color(letter)
        game.correct_guess_letter?(letter) ? :green : :red
      end
    end
  end
end
