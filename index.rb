require_relative 'robo'

puts 'Задайте максимальный размер стола(X, Y), или SKIP чтобы пропустить(будет установлен размер 5 х 6)'

table = gets.chomp

if table.include?('SKIP')
  table_x = 5
  table_y = 6
else
  x = table.split(', ')
  table_x = x[0]
  table_y = x[1]
end

puts 'Установите робота на стол командой "PLACE"'

place = gets.chomp.upcase
until %w[PLACE].include?(place)
  puts 'Введите команду "PLACE"'
  place = gets.chomp.upcase
end
puts 'Задайте позицию X'
position_x = gets.chomp.to_i
while position_x > table_x.to_i
  puts "Введите число меньше или равно #{table_x}!"
  position_x = gets.chomp.to_i
end
puts 'Задайте позицию Y'
position_y = gets.chomp.to_i
while position_y > table_y.to_i
  puts "Введите число меньше или равно #{table_y}!"
  position_y = gets.chomp.to_i
end
puts 'Задайте направление "NORTH" "WEST" "SOUTH" "EAST"'
direction = gets.chomp.upcase
until %w[NORTH WEST EAST SOUTH].include?(direction)
  puts 'Введите корректное направление!'
  direction = gets.chomp.upcase
end
game = Robot.new(position_x, position_y, direction, table_x, table_y).foo



