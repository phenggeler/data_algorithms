class TspGreedy
   def initialize
   end 
end


def find_next_neighbor(start, adj_matrix, cityCount)
  puts 'Leaving ' << @city[start]
  hash = Hash.new
  1.upto(cityCount) do |i|
      distance = adj_matrix[start][i]
      unless distance.eql? 0 
        if !@visited.include? @city[i]
          hash[i] = distance
        end
      end
  end
  if (hash.any?)
    min = hash.values.min
    neighbor = hash.key(min)
    @travelweight = @travelweight + min
    puts 'Heading to ' << @city[neighbor] << ' - Travel Weight: ' << @travelweight.to_s
    @visited.push(@city[neighbor])
    find_next_neighbor(neighbor, adj_matrix, cityCount)
  else
    @travelweight = @travelweight + adj_matrix[start][@finish]
    puts 'Heading home to ' << @city[@finish] << ' - Travel Weight: ' << @travelweight.to_s
  end
end

adj_matrix = [
  [0,  1,   2,   3,   4,    5],
  [1,  0,  19,  29,  25,   22],
  [2, 19,   0,  24,  23,   26],
  [3, 29,  24,   0,  21,   20],
  [4, 25,  23,  21,   0,   25],
  [5, 22,  26,  20,  25,    0],

]

@city = {
    1 => 'Mumbai',
    2 => 'Delhi',
    3 => 'Surat',
    4 => 'Kanpur', 
    5 => 'Agra'
}

start = 5
puts 'Starting in ' << @city[start]
@finish = start
cityCount = 5
@travelweight = 0
@visited = []
@visited.push(@city[start])

find_next_neighbor(start, adj_matrix, cityCount)

