require 'hangman/model/game'

class HangmanGuess
  include Glimmer::LibUI::CustomShape

  option :game
  option :size, default: 480
  option :thickness, default: 2
  option :font_size, default: 33
  
  body {
    text(size*0.1, size*0.8, size*0.8) {
      default_font family: 'Courier New', size: font_size
      
      content(game, computed_by: [:guess, :incorrect_guess_count]) do
        game.guess.size.times do |letter_index|
          letter = rendered_letter(letter_index)
          string(letter) {
            color string_color(letter_index)
          }
          string(' ')
        end
      end
    }
  }
  
  def rendered_letter(letter_index)
    letter = game.lost? ? game.word[letter_index] : game.guess[letter_index]
    letter = '_' if letter == ' '
    letter.upcase
  end
  
  def string_color(letter_index)
    if game.lost?
      if game.guessed_letter_at_index?(letter_index)
        :red
      else
        :green
      end
    elsif game.won?
      :green
    else
     :black
   end
  end
end
