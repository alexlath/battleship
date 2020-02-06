class Board
  attr_reader :cells

  def initialize
    @cells = {
      "A1" => Cell.new("A1"),
      "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"),
      "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"),
      "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"),
      "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"),
      "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"),
      "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"),
      "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"),
      "D4" => Cell.new("D4")
    }
  end

  def valid_coordinate?(coordinate_parameter)
    @cells.include?(coordinate_parameter)
  end

  def valid_placement?(ship_parameter, coordinates_parameter)
    letters = coordinates_parameter.map {|coordinate| coordinate[0].ord }.uniq.sort!
    numbers = coordinates_parameter.map {|coordinate| coordinate[1].to_i }.uniq.sort!

    if coordinates_parameter.length == ship_parameter.length
      if numbers.last - numbers.first == ship_parameter.length - 1 && letters.length == 1
        true
      else
        letters.last - letters.first == ship_parameter.length - 1 && numbers.length == 1
      end
    else
      false
    end
  end
end
