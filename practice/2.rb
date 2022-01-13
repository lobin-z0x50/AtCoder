#!/bin/ruby

N, Q = gets.split.map(&:to_i)
$count = 0

arr = (0...N).map{|i| ('A'.ord + i).chr }

if ENV['TEST']
  arr.shuffle!
end

def heavy?(x, y)
  return true if $count >= Q
  $count += 1
  puts "? #{x} #{y}"
  gets[0] == '<'
end

def _sort(a, s, e, p)
  h = []
  l = []
  (s...e).each do |i|
    if heavy? p, a[i]
      h << a[i]
    else
      l << a[i]
    end
  end
  [h, l]
end

def sort(a, s=0, e=nil)
  e ||= a.length
  h, l = _sort a, s+1, e, a[0]
  if h.length >= 2
    h = sort h
  end
  if l.length >= 2
    l = sort l
  end
  l << a[0]
  l += h
end

ans = sort arr
puts "! #{ans.join ''}"

