require 'hangman/model/game'

require 'hangman/view/hangman_scene'
require 'hangman/view/hangman_guess'

class Hangman
  module View
    class Hangman
      include Glimmer::LibUI::Application
    
      MODIFIER = OS.mac? ? :command : :control
      
      option :size, default: 480
      
      attr_reader :game
      
      before_body do
        @game = Model::Game.new
        menu_bar
      end
  
      body {
        window {
          content_size size, size
          title 'Hangman'
          resizable false
          
          area {
            background = rectangle(0, 0, size, size) {
              fill :white
            }
            
            hangman_scene(game:, size:)
            
            hangman_guess(game:, size:)
            
            on_key_down do |event|
              case event
              in {key: 'a'..'z', modifier: nil, modifiers: []}
                game.guess_letter(event[:key])
                handled = true
              in {key: 'r', modifier: nil, modifiers: [MODIFIER]}
                game.restart
                handled = true
              else
                handled = false
              end
              handled
            end
          }
        }
      }
  
      def menu_bar
        menu('Game') {
          menu_item('Restart') {
            on_clicked do
              game.restart
            end
          }
          
          quit_menu_item if OS.mac?
        }
        menu('Help') {
          if OS.mac?
            about_menu_item {
              on_clicked do
                display_about_dialog
              end
            }
          end
          
          menu_item('About') {
            on_clicked do
              display_about_dialog
            end
          }
        }
      end
  
      def display_about_dialog
        message = "Hangman #{VERSION}\n\n#{LICENSE}"
        msg_box('About', message)
      end
    end
  end
end
