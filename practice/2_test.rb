#!/bin/ruby
require 'open3'

stdin, stdout, stderr, wait_thr = *Open3.popen3("TEST=1 ruby #{__dir__}/2.rb")

stdin.puts '5 9'
stdin.flush

while true do
  c = stdout.readchar
  l = stdout.readline
  puts l
  break if l.start_with? '!'

  x, y = l.split
  if x < y
    puts '<'
    stdin.puts '<'
  else
    puts '>'
    stdin.puts '>'
  end
end

stdin.close
stdout.close
stderr.close
