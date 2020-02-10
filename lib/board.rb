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

  # new method: valid_coordinates?(coordinates_parameter)

  def target_coordinates_empty?(ship_parameter, coordinates_parameter)
    coordinates_parameter.all? { |coordinate| @cells[coordinate].ship == nil }
  end

  def valid_placement?(ship_parameter, coordinates_parameter)
    # move these two lines into the if statement so it only runs on valid and empty coordinates.
    letters = coordinates_parameter.map { |coordinate| coordinate[0].ord }.uniq.sort
    numbers = coordinates_parameter.map { |coordinate| coordinate[1].to_i }.uniq.sort

    # if valid_coordinates?(coordinates_parameter) would replace next line
    if coordinates_parameter.all? { |coordinate| valid_coordinate?(coordinate) } &&
      target_coordinates_empty?(ship_parameter, coordinates_parameter)
      return true if letters.last - letters.first == ship_parameter.length - 1 && numbers.length == 1
      return true if numbers.last - numbers.first == ship_parameter.length - 1 && letters.length == 1
      return false
    else
      return false
    end
  end

  def place(ship_parameter, coordinates_parameter)
    if valid_placement?(ship_parameter, coordinates_parameter)
      coordinates_parameter.each do |coordinate|
        @cells[coordinate].place_ship(ship_parameter)
      end
    end
  end

  def valid_target?(coordinate_parameter)
    valid_coordinate?(coordinate_parameter) && !@cells[coordinate_parameter].fired_upon?
  end

# refactor this method later
  def render(show_ship_parameter = false)
    header = "  1 2 3 4 \n"
    row_a = "A #{@cells["A1"].render(show_ship_parameter)} #{@cells["A2"].render(show_ship_parameter)} #{@cells["A3"].render(show_ship_parameter)} #{@cells["A4"].render(show_ship_parameter)} \n"
    row_b = "B #{@cells["B1"].render(show_ship_parameter)} #{@cells["B2"].render(show_ship_parameter)} #{@cells["B3"].render(show_ship_parameter)} #{@cells["B4"].render(show_ship_parameter)} \n"
    row_c = "C #{@cells["C1"].render(show_ship_parameter)} #{@cells["C2"].render(show_ship_parameter)} #{@cells["C3"].render(show_ship_parameter)} #{@cells["C4"].render(show_ship_parameter)} \n"
    row_d = "D #{@cells["D1"].render(show_ship_parameter)} #{@cells["D2"].render(show_ship_parameter)} #{@cells["D3"].render(show_ship_parameter)} #{@cells["D4"].render(show_ship_parameter)} \n"
    header + row_a + row_b + row_c + row_d
  end

end
