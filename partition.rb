class Partition
  def initialize
    @sum = []
    @result = []
  end
end
  
  
def findSubsets(arr)  
  answer = []
  
  arr.length.times do |i|
    tmp = arr.combination(i).to_a
    tmp.each do |x|
      y = arr - x
      if (x.inject(:+).eql? y.inject(:+))
        answer.push("\n"+'The sum of ['+x.join(', ')+'] = ' + x.inject(:+).to_s + "\n"+'The sum of ['+y.join(', ')+'] = ' + y.inject(:+).to_s)
      else
        #puts '['+x.join(', ')+'] cannot be summed to equal ['+y.join(', ') +']'
      end
    end
  end
  if !answer.any?
    
    puts "\n"+'Solution does not exist for [' << arr.join(', ') << ']'
  else
  answer.each do |b|
    puts b
  end
  end
end
  
  arr = [1,2,5,7,8,9,11,15]
  findSubsets(arr)
  arr = [1, 5, 3]
  findSubsets(arr)


