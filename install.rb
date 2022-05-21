#!/usr/bin/env ruby
# frozen_string_literal: true

require 'fileutils'
include FileUtils

def run_cmd(cmd)
  puts cmd
  `#{cmd}`
  puts 'Done.'
end

def run_cmd_multiline(cmd)
  # Remove commented lines
  cmd.lines.map! do |line|
    striped = line.strip

    striped[0] == "#" ? "" : striped
  end

  run_cmd(cmd.gsub("\n", " "))
end

def homebrew_not_installed
  `brew help`
  false
rescue StandardError
  true
end

if homebrew_not_installed
  puts 'Please run the command to install Homebrew: /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
  exit
end

src_base = Dir.getwd
home_dir = Dir.home
list = [
  { src: "#{src_base}/zshrc.sh",  desc: "#{home_dir}/.zshrc"     },
  { src: "#{src_base}/gitconfig", desc: "#{home_dir}/.gitconfig" },
  { src: "#{src_base}/gemrc",     desc: "#{home_dir}/.gemrc"     },
]

list.each do |conf|
  if File.exist? conf[:desc]
    puts "File #{conf[:desc]} exists."
  else
    ln_s conf[:src], conf[:desc]
  end
end

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


run_cmd_multiline %{
  brew install
    the_silver_searcher
    ripgrep
    fd
    starship
    jq
}

run_cmd_multiline %{
  brew install --cask
    google-chrome
    visual-studio-code
    docker
    slack
    rectangle
    tableplus

    # skitch
    # vlc
    # sourcetree
    # sequel-pro
    # postico
}
run_cmd 'xcode-select --install' # install command line tools

run_cmd 'gem install git-up'
run_cmd 'git clone git@github.com:scmbreeze/scm_breeze.git ~/.scm_breeze && ~/.scm_breeze/install.sh'
