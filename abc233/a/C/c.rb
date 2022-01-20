#!/bin/ruby
# https://atcoder.jp/contests/abc233/submissions/28650795

N, X = gets.split.map(&:to_i)

$numbers = []
N.times do
  $numbers << gets.split.drop(1).map(&:to_i).sort
end

$count = 0

def proc2(row, xx)
  (0...$numbers[row].length).each do |col|
    v = $numbers[row][col]
    $stderr.puts "[#{row}, #{col}] = #{v}"
    _x = xx * v
    if row == $numbers.length-1
      if _x == X
        $count += 1
      end
    else
      proc2(row+1, _x)
    end
  end
end

proc2(0, 1)

puts $count