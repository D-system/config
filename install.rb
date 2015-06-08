#!/usr/bin/env ruby
require 'fileutils'
include FileUtils

linux = ! RUBY_PLATFORM.match("linux").nil?

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
  if File.exists? conf[:desc]
    puts "File #{conf[:desc]} exists."
  else
    ln_s conf[:src], conf[:desc]
  end
end

puts 'Installing/updating git submodules...'
%x{ git submodule update --init }
puts 'Done.'

if linux
  puts 'sudo apt-get install -y silversearcher-ag'
  `sudo apt-get install -y silversearcher-ag`
else
  puts 'brew install the_silver_searcher'
  `brew install the_silver_searcher`
end
puts 'Done'

puts 'gem install git-up'
`gem install git-up`
puts 'Done'
