#!/bi/ruby
# AC https://atcoder.jp/contests/abs/submissions/28496911

class Searcher

  def step(ctx, dx, dy)
    ctx[0] += dx
    ctx[1] += dy
    ctx[0] >= 0 && ctx[1] >= 0
  end

  def search(start, gt, initial, gx, gy)
    contexts = {initial => 1}
    (start .. gt).each do |current_t|
      $stderr.puts "--- STEP [#{current_t}] ---"
      remains = gt - current_t
      $stderr.puts "remains = #{remains}"
      nexts = {}
      [[1,0], [0,1], [-1,0],[0,-1]].each do |dx, dy|
        contexts.each_key do |c|
          c1 = c.dup
          if step c1, dx, dy
            distance = (gx - c1[0]).abs + (gy - c1[1]).abs
            $stderr.puts " #{c1} distance=#{distance}"
            next if distance > remains
            return [gx, gy] if remains%2 == distance%2
            return nil
          end
        end
      end
      contexts = nexts
      $stderr.puts "contexts=#{contexts.keys.inspect}"
    end

    contexts.each_key do |c|
      return c if c[0] == gx && c[1] == gy
    end
    nil
  end
end

searcher = Searcher.new

ctx = [0,0]
step = 1
N = gets.to_i
N.times do
  t, x, y = gets.split.map(&:to_i)
  ctx = searcher.search(step, t, ctx, x, y)
  unless ctx
    puts :No
    exit
  end
  step = t+1
end

puts :Yes

