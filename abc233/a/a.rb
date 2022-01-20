#!/bin/ruby
# https://atcoder.jp/contests/abc233/submissions/28649472

X, Y = gets.split.map(&:to_i)

ans = X >= Y ? 0 : ((Y - X) / 10.0).ceil

puts ans
