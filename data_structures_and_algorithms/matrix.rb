# https://stackoverflow.com/questions/42519/how-do-you-rotate-a-two-dimensional-array

def rotate(matrix)
  return false unless matrix.length > 0 && matrix.length == matrix[0].length

  # first index position accesses the row - y
  # second index position access the column - x 
  # matrix[row][column]
  size = matrix.length
  layer_count = size / 2

  (0..layer_count-1).each do |layer|
    first = layer # 0
    last = size - first - 1
    puts "Layer: #{layer}, First: #{first}, Last: #{last}"

    # move within a single layer
    (first..last).each do |element|
      offset = element - first
      puts [first, last, element, offset].to_s

      top_element = [first, element]
      right_side = [element, last]
    end

    # # get the corners
    # top_left = matrix[first][first]
    # top_right = matrix[first][last]
    # bot_right = matrix[last][last]
    # bot_left = matrix[last][first]

    # # swap the corners
    # matrix[first][first] = bot_left
    # matrix[first][last] = top_left
    # matrix[last][last] = top_right
    # matrix[last][first] = bot_right

    # no we need to walk along the other layers

  end

  print_matrix(matrix)
end

def print_matrix(matrix)
  matrix.each do |row|
    puts row.to_s
  end
end

matrix_4x4 = [
  [1,2,3,4],
  [4,5,6,8],
  [9,10,11,12],
  [13,14,15,16]
]
matrix_5x5 = [
  [0,1,2,3,4],
  [0,4,5,6,8],
  [0,9,10,11,12],
  [0,13,14,15,16],
  [0,17,18,19,20]
]
matrix_2x2 = [
  [1,2],
  [3,4]
]
matrix_3x3 = [
  [1,2,3],
  [4,5,6],
  [7,8,9]
]

# not a NxN matrix
# puts rotate([[1,2,3],[1,2,3]])
rotate(matrix_4x4)

