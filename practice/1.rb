#!/bin/ruby

a = gets.to_i
b, c = gets.split(' ').map(&:to_i)
s = gets.chomp

ans = a + b + c
puts "#{ans} #{s}"

