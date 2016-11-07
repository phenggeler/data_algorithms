class LongestCommon
  def initialize()
  end
end


def lcs(x, y, m, n)

  l = Array.new(m+1) { Array.new(n+1) }
  b = Array.new(m+1) { Array.new(n+1) }
  
  @upward_direction = 1
  @point_left = 2
  @point_up_and_also_left = 3
  
  m.times do |i|
      l[i][0] = 0
  end
  
  n.times do |i|
      l[0][i] = 0
  end

  1.upto(m-1) do |i|
      1.upto(n-1) do |j|
          if(x[i-1].eql? y[j-1])
              l[i][j] = l[i-1][j-1] + 1
              b[i][j] = @point_up_and_also_left
          else
            if (l[i - 1][j] >= l[i][j - 1])
              l[i][j] = l[i - 1][j]
              b[i][j] = @upward_direction
            else
    		  l[i][j] = l[i][j - 1];
    		  b[i][j] = @point_left;
            end
        end
      end
  end
  result = printLCS(b, x, m, n)
  #answer = l[m][n].to_s << ' is optimal number of towns in following order: ' << result.join(', ')
  l
end

def printLCS(b, seq1, i, j) 
    result = []
    if (i == 0 || j == 0) 
        return
    end
    
    if (b[i][j] == @point_up_and_also_left) 
        printLCS(b, seq1, i - 1, j - 1);
        result.push(seq1[i - 1]);
        puts b[i][j]
    else 
        if (b[i][j] == @upward_direction) 
            printLCS(b, seq1, i - 1, j);
        else
            printLCS(b, seq1, i, j - 1);
        end
    end
    puts result
    puts result
end


arr1 = ['Mura', 'Akuntsu', 'Nukak', 'Wauja', 'Mbya', 'Baniwa', 'Kubeo', 'Piraha', 'Tupi', 'Witoto']
m = arr1.size
arr2 = ['Baniwa', 'Witoto', 'Akuntsu', 'Nukak', 'Mura', 'Tupi', 'Piraha', 'Wauja', 'Mbya', 'Kubeo']
n = arr2.size
t = lcs(arr1, arr2, m+1, n+1)
puts t[m][n].to_s << ' is optimal number of towns'
