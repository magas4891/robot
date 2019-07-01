# frozen_string_literal: true

class Robot
  ALLOWED_COMMAND = %w(PLACE MOVE LEFT RIGHT REPORT)
  ALLOWED_DIRRECTION = %w(NORTH WEST EAST SOUTH)

  def initialize(position_x, position_y, direction, table_x, table_y)
    @position_x = position_x
    @position_y = position_y
    @direction = direction
    @table_x = table_x
    @table_y = table_y
  end

  def foo
    puts 'Введите команду: '
    command = gets.chomp.upcase
    if command == ''
      puts 'Нет данных'
      return
    end
    arr = command.split(' ')
    case arr[0]
    when 'LEFT' then turn_left
    when 'RIGHT' then turn_right
    when 'MOVE' then move
    when 'REPORT' then report
    end
  end

  def turn_left
    case @direction
    when 'WEST'
      @direction = 'SOUTH'
    when 'NORTH'
      @direction = 'WEST'
    when 'EAST'
      @direction = 'NORTH'
    when 'SOUTH'
      @direction = 'EAST'
    end
    foo
  end

  def turn_right
    case @direction
    when 'WEST'
      @direction = 'NORTH'
    when 'NORTH'
      @direction = 'EAST'
    when 'EAST'
      @direction = 'SOUTH'
    when 'SOUTH'
      @direction = 'WEST'
    end
    foo
  end

  def move
    case @direction
    when 'SOUTH'
      @position_y -= 1 unless @position_y.zero?
    when 'WEST'
      @position_x -= 1 unless @position_x.zero?
    when 'NORTH'
      @position_y += 1 unless @position_y == @table_y.to_i
    when 'EAST'
      @position_x += 1 unless @position_x == @table_x.to_i
    end
    foo
  end

  def report
    puts "Моя позиция: #{@position_x}, #{@position_y}, #{@direction}"
    foo
  end

end
