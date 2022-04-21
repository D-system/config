#!/usr/bin/env ruby
# frozen_string_literal: true

require 'fileutils'
include FileUtils

linux = !RUBY_PLATFORM.match('linux').nil?

def run_cmd(cmd)
  puts cmd
  `#{cmd}`
  puts 'Done.'
end

def homebrew_not_installed
  `brew help`
  false
rescue StandardError
  true
end

src_base = '~/config/'
list = [
  { src: "#{src_base}emacs.el", desc: '~/.emacs' },
  { src: "#{src_base}zshrc.sh", desc: '~/.zshrc' },
  { src: "#{src_base}gitconfig", desc: '~/.gitconfig' },
  { src: "#{src_base}gemrc", desc: '~/.gemrc' }
]

# Convert to absolute path
list.each do |conf|
  conf[:desc] = File.expand_path(conf[:desc])
  conf[:src] = File.expand_path(conf[:src])
end

list.each do |conf|
  if File.exist? conf[:desc]
    puts "File #{conf[:desc]} exists."
  else
    ln_s conf[:src], conf[:desc]
  end
end

puts 'Installing/updating git submodules...'
run_cmd 'git submodule update --init'
puts 'Done.'

if linux
  run_cmd 'sudo apt-get install -y silversearcher-ag htop screen emacs24-nox git zsh'
else
  if homebrew_not_installed
    puts 'Please run the command to install Homebrew: /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
    exit
  end

#   run_cmd 'brew install mysql'
#   run_cmd 'brew install postgresql'
#   run_cmd 'brew link --force postgresql'
  # run_cmd 'brew install v8-315' # For therubyracer
  run_cmd 'brew install the_silver_searcher' # ag
  # run_cmd 'brew install graphviz'
  run_cmd 'brew install lazydocker'
  run_cmd 'brew install ripgrep' # rg
  run_cmd 'brew install fd'
  run_cmd 'brew install starship'

  run_cmd 'brew install nvm'
  run_cmd 'mkdir ~/.nvm'
  run_cmd 'nvm install 16.14.2' # LTS version

  run_cmd 'brew install rbenv'
  ruby_version = '3.1.2'
  run_cmd "rbenv install #{ruby_version}"
  run_cmd "rbenv global #{ruby_version}"

  run_cmd 'brew install pyenv'
  python_version = '3.10.4'
  run_cmd "pyenv install #{python_version}"
  run_cmd "pyenv global #{python_version}"

  run_cmd 'brew install --cask google-chrome'
  run_cmd 'brew install --cask firefox'
  run_cmd 'brew install --cask skitch'
  run_cmd 'brew install --cask vlc'
  # run_cmd 'brew install --cask sourcetree'
  run_cmd 'brew install --cask sequel-pro'
  run_cmd 'brew install --cask postico'
  # run_cmd 'brew install --cask imageoptim'
  run_cmd 'brew install --cask visual-studio-code'
  run_cmd 'brew install --cask sublime-text'
  run_cmd 'brew install --cask docker'
  run_cmd 'brew install --cask slack'
  run_cmd 'brew install --cask selfcontrol'
  run_cmd 'brew install --cask spotify'
  run_cmd 'brew install --cask divvy'
  # run_cmd 'brew install --cask obs'
  # run_cmd 'brew install --cask molotov'
  # run_cmd 'brew install --cask skype'

  run_cmd 'xcode-select --install'
  run_cmd 'sudo xcodebuild -license'
#   run_cmd 'brew install --cask nordvpn'
end

run_cmd 'gem install git-up'
run_cmd 'git clone git@github.com:scmbreeze/scm_breeze.git ~/.scm_breeze && ~/.scm_breeze/install.sh'
