require 'hangman/model/game'

class HangmanScene
  include Glimmer::LibUI::CustomShape

  option :game
  option :size, default: 480
  option :thickness, default: 2
  
  body {
    @background = rectangle(0, 0, size, size) {
      fill :white
    }
    
    @base = line(size*0.1, size*0.7, size*0.3, size*0.7) {
      stroke :black, thickness: thickness
    }
    
    @column = line(size*0.2, size*0.1, size*0.2, size*0.7) {
      stroke :black, thickness: thickness
    }
    
    @ceiling = line(size*0.2, size*0.1, size*0.6, size*0.1) {
      stroke :black, thickness: thickness
    }
    
    @rope = line(size*0.6, size*0.1, size*0.6, size*0.25) {
      stroke :black, thickness: thickness
    }
    
    @head = circle(size*0.6, size*0.25, size*0.05, size*0.1) {
      stroke :black, thickness: thickness
      fill :white
    }
    
    @torso = line(size*0.6, size*0.3, size*0.6, size*0.5) {
      stroke :black, thickness: thickness
    }
    
    @left_hand = line(size*0.6, size*0.3, size*0.5, size*0.4) {
      stroke :black, thickness: thickness
    }

    @right_hand = line(size*0.6, size*0.3, size*0.7, size*0.4) {
      stroke :black, thickness: thickness
    }

    @left_leg = line(size*0.6, size*0.5, size*0.5, size*0.6) {
      stroke :black, thickness: thickness
    }

    @right_leg = line(size*0.6, size*0.5, size*0.7, size*0.6) {
      stroke :black, thickness: thickness
    }
    
    # TODO depending on the word, display dashes with different sizes/font-sizes
    # TODO try to display a standard number of dashes at first, like 10 for words with 10 letters
  }
end
