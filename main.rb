# encoding: utf-8

current_path = File.dirname(__FILE__)
require "#{current_path}/lib/game.rb"
require "#{current_path}/lib/result_printer.rb"

name = ARGV[0]
test = Game.new(name)

test.play_test

ResultPrinter.new.print_result(test.points)
