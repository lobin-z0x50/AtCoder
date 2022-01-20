#!/bin/ruby

L, R = gets.split.map(&:to_i)
S = gets.chomp

print S[0, L-1]
print S[L-1, R-L+1].reverse
print S[R .. -1]
print "\n"
