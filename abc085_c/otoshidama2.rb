#!/bin/ruby

N, Y = gets.split.map(&:to_i)

def _search(y, n, ans, x, idx)
  a5 = ans.dup
  a5[idx]+=1
  y-=x
  return false if y < 0
  search y, n-1, a5
end

DD = [[10,0], [5,1], [1,2]]

def search(y, n, ans)
  $stderr.puts "#{y}\t#{n}\t#{ans}"
  if y == 0
    if n == 0
      return ans
    end
    return false
  end
  if n <= 0
    return false
  end

  n1= y / 1
  return false if n1< n

  n10 = y / 10
  return false if n10> n

  [0,1,2].shuffle.each do |i|
    x, idx = DD[i]
    $stderr.puts " x=#{x}, idx=#{idx}"
    ret = _search y, n, ans, x, idx
    return ret if ret
  end
  false
end


ans = search Y/1000, N, [0,0,0]
if ans
  puts ans.join(' ')
else
  puts "-1 -1 -1"
end
