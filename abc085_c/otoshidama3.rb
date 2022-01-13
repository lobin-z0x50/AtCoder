#!/bi/ruby
# https://blog.hamayanhamayan.com/entry/2018/01/07/224854

N, Y = gets.split.map(&:to_i)

(0..N).each do |a|
  (0..(N-a)).each do |b|
    c = N - a - b
    if 10000 * a + 5000 * b + 1000 * c == Y
      puts "#{a} #{b} #{c}"
      exit
    end
  end
end
puts "-1 -1 -1"
