#!/bin/ruby

N, Y = gets.split.map(&:to_i)

def search(y, n, ans)
  #$stderr.puts "#{y}\t#{n}\t#{ans}"
  if y == 0
    if n == 0
      return ans
    end
    return false
  end
  if n == 0
    return false
  end

  n1= y / 1
  return false if n1< n

  n10 = y / 10
  return false if n10> n

  a10 = ans.dup
  a10[0]+=1
  ret = search y-10, n-1, a10
  return ret if ret

  a5 = ans.dup
  a5[1]+=1
  ret = search y-5, n-1, a5
  return ret if ret

  a1 = ans.dup
  a1[2]+=1
  ret = search y-1, n-1, a1
  return ret if ret
end


ans = search Y/1000, N, [0,0,0]
if ans
  puts ans.join(' ')
else
  puts "-1 -1 -1"
end

