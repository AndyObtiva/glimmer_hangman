require 'glimmer_hangman/model/game'

class GlimmerHangman
  module View
    class HangmanScene
      include Glimmer::LibUI::CustomShape
    
      option :game
      option :size, default: 480
      option :thickness, default: 2
      
      body {
        composite_shape(0, 0) {
          content(game, computed_by: [:guess, :incorrect_guess_count]) do
            stroke stroke_color, thickness: thickness
            
            with_one_incorrect_guess {
              base = line(size*0.2, size*0.7, size*0.4, size*0.7)
            }
            
            with_one_more_incorrect_guess {
              column = line(size*0.3, size*0.1, size*0.3, size*0.7)
            }
            
            with_one_more_incorrect_guess {
              ceiling = line(size*0.3, size*0.1, size*0.7, size*0.1)
            }
            
            with_one_more_incorrect_guess {
              rope = line(size*0.7, size*0.1, size*0.7, size*0.25)
            }
            
            with_one_more_incorrect_guess {
              head = circle(size*0.7, size*0.25, size*0.05, size*0.1) {
                fill :white
              }
            }
            
            with_one_more_incorrect_guess {
              torso = line(size*0.7, size*0.3, size*0.7, size*0.5)
            }
            
            with_one_more_incorrect_guess {
              left_hand = line(size*0.7, size*0.3, size*0.6, size*0.4)
            }
        
            with_one_more_incorrect_guess {
              right_hand = line(size*0.7, size*0.3, size*0.8, size*0.4)
            }
        
            with_one_more_incorrect_guess {
              left_leg = line(size*0.7, size*0.5, size*0.6, size*0.6)
            }
        
            with_one_more_incorrect_guess {
              right_leg = line(size*0.7, size*0.5, size*0.8, size*0.6)
            }
          end
        }
      }
      
      private
      
      def stroke_color
        if game.lost?
          :red
        elsif game.won?
          :green
        else
          :black
        end
      end
      
      def with_one_incorrect_guess(&shape_content)
        @required_incorrect_guess_count = 1
        with_required_incorrect_guess_count(&shape_content)
      end
      
      def with_one_more_incorrect_guess(&shape_content)
        @required_incorrect_guess_count += 1
        with_required_incorrect_guess_count(&shape_content)
      end
      
      def with_required_incorrect_guess_count(&shape_content)
        shape_content.call if game.incorrect_guess_count >= @required_incorrect_guess_count
      end
    end
  end
end
