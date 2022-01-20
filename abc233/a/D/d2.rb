#!/bin/ruby
# https://atcoder.jp/contests/abc233/submissions/28652803

N, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

$count = 0
$cache = Array.new(N) { 0 }

def proc(i1, i2, val)
  return if i2 == A.length
  val += A[i2]
  $cache[i2] = val
  #$stderr.puts "[#{i1}, #{i2}] = #{A[i2]} \t\t val = #{val}"
  case val <=> K
    when 0 then $count+=1
    #when 1 then return
  end
  proc(i1, i2+1, val)
end

def proc2(i1)
  (i1...A.length).each do |i2|
    val = $cache[i2]
    val -= A[i1-1]
    #$stderr.puts "[#{i1}, #{i2}]  \t\t val = #{val}"
    $cache[i2] = val
    case val <=> K
      when 0 then $count+=1
      #when 1 then return
    end
  end
end

proc 0, 0, 0

dosu = { }
(0...A.length-1).each do |i1|
  if dosu.has_key? $cache[i1]
    dosu[$cache[i1]] += 1
  else
    dosu[$cache[i1]] = 1
  end
  
  vv = $cache[i1+1] - K
  if dosu.has_key? vv
    $count += dosu[vv]
  end
end

puts $count