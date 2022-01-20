#!/bin/ruby

N, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

$count = 0

def proc(i1, i2, val)
  return if i2 == A.length
  val += A[i2]
  $stderr.puts "[#{i1}, #{i2}] = #{A[i2]} \t\t val = #{val}"
  case val <=> K
    when 0 then $count+=1
    #when 1 then return
  end
  proc(i1, i2+1, val)
end

(0...A.length).each do |i1|
  proc i1, i1, 0
end
puts $count