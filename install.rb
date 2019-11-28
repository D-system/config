#!/usr/bin/env ruby
require 'fileutils'
include FileUtils

linux = ! RUBY_PLATFORM.match("linux").nil?

def run_cmd(cmd)
  puts cmd
  `#{cmd}`
  puts 'Done.'
end

def homebrew_not_installed
  `brew help`
  false
rescue
  true
end

src_base = '~/config/'
list = [
        {src: "#{src_base}emacs.el", desc: "~/.emacs"},
        {src: "#{src_base}zshrc.sh", desc: "~/.zshrc"},
        {src: "#{src_base}gitconfig", desc: "~/.gitconfig"},
        {src: "#{src_base}gemrc", desc: "~/.gemrc"}
       ]

# Convert to absolute path
list.each do |conf|
  conf[:desc] = File.expand_path( conf[:desc] )
  conf[:src] = File.expand_path( conf[:src] )
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
  run_cmd 'brew install the_silver_searcher'
  if homebrew_not_installed
    puts 'Please run the command to install Homebrew: ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" ; brew install caskroom/cask/brew-cask ; brew cask help'
    exit
  end
  run_cmd 'brew install the_silver_searcher'
  run_cmd 'brew cask install google-chrome'
  run_cmd 'brew cask install firefox'
  run_cmd 'brew cask install skitch'
  run_cmd 'brew cask install vlc'
  # run_cmd 'brew cask install sourcetree'
  run_cmd 'brew cask install sequel-pro'
  run_cmd 'brew cask install postico'
  # run_cmd 'brew cask install imageoptim'
  run_cmd 'brew cask install visual-studio-code'
  run_cmd 'brew cask install sublime-text'
  run_cmd 'brew cask install docker'
  run_cmd 'brew cask install slack'
  run_cmd 'brew cask install selfcontrol'
  run_cmd 'brew cask install nordvpn'
  run_cmd 'brew cask install spotify'
  run_cmd 'brew cask install divvy'
  # run_cmd 'brew cask install obs'
  # run_cmd 'brew cask install molotov'
  # run_cmd 'brew cask install skype'
end

run_cmd 'gem install git-up'
run_cmd 'git clone git://github.com/scmbreeze/scm_breeze.git ~/.scm_breeze'
