# <img alt="Glimmer Hangman Icon" src="https://raw.githubusercontent.com/AndyObtiva/glimmer_hangman/master/icons/linux/Glimmer%20Hangman.png" height=85 /> Glimmer Hangman 1.0.0
## [<img src="https://raw.githubusercontent.com/AndyObtiva/glimmer/master/images/glimmer-logo-hi-res.png" height=40 /> Glimmer DSL for LibUI Application](https://github.com/AndyObtiva/glimmer-dsl-libui)
[![Gem Version](https://badge.fury.io/rb/glimmer_hangman.svg)](http://badge.fury.io/rb/glimmer_hangman)

Hangman (word game) that runs on Mac, Windows, and Linux. Built with [Ruby](https://www.ruby-lang.org/) and [Glimmer DSL for LibUI](https://github.com/AndyObtiva/glimmer-dsl-libui) (Prerequisite-Free Ruby Desktop Development Cross-Platform Native GUI Library) using [Application Scaffolding](https://github.com/AndyObtiva/glimmer-dsl-libui#scaffold-application).

Implementation started at the RubyConf 2024 Hack Day Event for Glimmer DSL for LibUI, which was connected to the [RubyConf 2024 workshop "How To Build Basic Desktop Applications in Ruby"](https://github.com/AndyObtiva/how-to-build-desktop-applications-in-ruby/tree/rubyconf2024).

![glimmer-dsl-libui-mac-hangman.gif](/screenshots/glimmer-dsl-libui-mac-hangman.gif)

## Setup

Assuming you have [Ruby](https://www.ruby-lang.org/) installed (standard MRI / CRuby).

Run:

```
gem install glimmer_hangman
```

## Usage

Run:

```
glimmer_hangman
```

or just:

```
hangman
```

The goal of the game is to guess a word by typing letters on the keyboard one by one, with 10 guesses max.

As each letter is typed, the word at the bottom reveals more letters if the typed letter is a correct part of the word, or otherwise the drawing at the top shows more parts of the scene of execution by hanging if the typed letter is incorrect. Also, typed letters show up at the bottom of the screen as green (correct) or (red) incorrect. The game is won once the correct word is guessed completely or if the hangman character is fully hung (10 guessed letters are incorrect).

Restart game by:
- Keyboard Shortcut: CMD+R on Mac or CTRL+R on Windows/Linux
- Menu Item: Game -> Restart

## Development

Clone project:

```
git clone https://github.com/AndyObtiva/glimmer_hangman.git
```

Change directory:

```
cd glimmer_hangman
```

Install project gems with [Bundler](https://bundler.io/):

```
bundle
```

Run application with `glimmer` command:

```
glimmer run
```

Or run using included binary script:

```
bin/glimmer_hangman
```

Package as a Ruby gem with `glimmer` command:

```
glimmer "package:gem"
```

Or package using equivalent direct rake command:

```
rake build
```

Generate updated gemspec with `glimmer command`:

```
glimmer "package:gemspec"
```

Or generate gemspec using equivalent direct rake command:

```
rake gemspec:generate
```

## Contributing to glimmer_hangman

-   Check out the latest master to make sure the feature hasn't been
    implemented or the bug hasn't been fixed yet.
-   Check out the issue tracker to make sure someone already hasn't
    requested it and/or contributed it.
-   Fork the project.
-   Start a feature/bugfix branch.
-   Commit and push until you are happy with your contribution.
-   Make sure to add tests for it. This is important so I don't break it
    in a future version unintentionally.
-   Please try not to mess with the Rakefile, version, or history. If
    you want to have your own version, or is otherwise necessary, that
    is fine, but please isolate to its own commit so I can cherry-pick
    around it.

## TODO

[TODO.md](TODO.md)

## Change Log

[CHANGELOG.md](CHANGELOG.md)

## Copyright

[MIT](LICENSE.txt)

Copyright (c) 2024 Andy Maleh. See
[LICENSE.txt](LICENSE.txt) for further details.

--

[<img src="https://raw.githubusercontent.com/AndyObtiva/glimmer/master/images/glimmer-logo-hi-res.png" height=40 />](https://github.com/AndyObtiva/glimmer) Built with [Glimmer DSL for LibUI](https://github.com/AndyObtiva/glimmer-dsl-libui) (Prerequisite-Free Ruby Desktop Development Cross-Platform Native GUI Library)

Glimmer Hangman icon made by <a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a>
