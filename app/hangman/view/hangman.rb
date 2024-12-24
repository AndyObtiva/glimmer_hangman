require 'hangman/model/game'

require 'hangman/view/hangman_scene'

class Hangman
  module View
    class Hangman
      include Glimmer::LibUI::Application
    
      SIZE = 480
          
      before_body do
        @game = Model::Game.new
        menu_bar
      end
  
      body {
        window {
          content_size SIZE, SIZE
          title 'Hangman'
          resizable false
          
          area {
            hangman_scene(game: @game, size: SIZE)
          }
        }
      }
  
      def menu_bar
        menu('File') {
          menu_item('Restart') {
            on_clicked do
              @game.restart
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
