require 'json'
require 'bundler'

Bundler.require

class Introduction
  def initialize
    greetings
  end

  def greetings
    puts "\n\n============================================================================".red
    puts "    Welcome to Ultimate Townhall App. This software is used to advertise".red
    puts "   The Hacking Project Bootcamp in all townhalls of Alpes-Maritimes (06),".red
    puts "      Territoire de Belfort (90) and the county of the Reunion (974).".red
    puts "============================================================================".red
    puts "\n Copyright © 2018 Get Email Corp."
    puts "\n\n\n\n"
  end
end

Introduction.new
$:.unshift File.expand_path("./../lib/views", __FILE__)
require 'index'
Index.new