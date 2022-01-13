#!/bi/ruby

Words = %w/dream dreamer erase eraser/

S = gets.chomp

def search(t)
  #$stderr.puts t
  Words.each do |w|
    if t.end_with? w
      t.slice!((t.length-w.length).. t.length)
      return true if t.empty?
      ret = search t
      return true if ret
    end
  end
  false
end

ans = search S
puts(ans ? :YES : :NO)


