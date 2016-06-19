puts '就職に関するお悩みを聞かせてください'

while input = STDIN.gets.chomp
  break if input == 'ありがとう'
  puts 'AI: へぇー'
end

puts 'どういたしまして'
