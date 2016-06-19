require 'pry'
require File.dirname(__FILE__) + "/answer"

Answer.load

puts '就職に関するお悩みを聞かせてください'

while input = STDIN.gets.chomp
  break if input == 'ありがとう'
  puts "AI: #{Answer.analysis(input)}"
  puts
end

puts 'どういたしまして'
