class GreedyPostal
def initialize
end 
end

def pack_van_greedy(weight, value, total_weight)
    if (weight.min > total_weight)
        puts 'No solution'
    else
       while (weight.min < total_weight)
            i = @value.index(@value.max)
            if (weight[i] < total_weight)
                puts 'Max weight is ' << @value.max.to_s
                tmp = [i, weight[i], value[i]]
                @finalweight = @finalweight + weight[i]
                @finalvalue = @finalvalue + value[i]
                @packedvan.push(tmp)
                total_weight = total_weight - weight[i]
            end
            @value.delete_at(i)
            @weight.delete_at(i)
        end
    end
end

@weight = [110, 210, 310, 330, 150]
@value = [20, 30, 25, 15, 35]


total_weight = 600

@packedvan = []
@finalweight = 0
@finalvalue = 0

pack_van_greedy(@weight, @value, total_weight)

puts 'Optimal Solution: '
@packedvan.each do |package|
    puts 'Added package ' << package[0].to_s << ' - Weight: ' << package[1].to_s << ' Value: ' << package[2].to_s
end
puts 'Total Weight: ' << @finalweight.to_s << ' Total Value: ' << @finalvalue.to_s
