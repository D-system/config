#!/usr/bin/env ruby
require 'fileutils'
include FileUtils

src_base = '~/config/'
list = [
        {src: "#{src_base}emacs.el", desc: "~/.emacs"},
        {src: "#{src_base}gitconfig", desc: "~/.gitconfig"}
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

puts "Don't forget to install submodules: `git submodule update`"
