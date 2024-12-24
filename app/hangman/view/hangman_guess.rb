require 'hangman/model/game'

class HangmanGuess
  include Glimmer::LibUI::CustomShape

  option :game
  option :size, default: 480
  option :thickness, default: 2
  
  body {
    text(size*0.1, size*0.8, size*0.8) {
      default_font family: 'Courier New', size: 24
      
      content(game, :guess) do
        game.guess.chars.each do |letter|
          rendered_letter = letter == ' ' ? '_' : letter.upcase
          string(rendered_letter) {
            color :black
          }
          string(' ') {
            color :black
          }
        end
      end
    }
  }
end
