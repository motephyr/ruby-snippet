$num = ARGV.first
def fib(n)
    n < 2 ? n : fib(n-1) + fib(n-2)
end
def fib2(x0,y0)
  Fiber.new do
    x,y = x0,y0
      loop do 
        Fiber.yield y
        x,y = y,x+y
      end
  end
end

g = fib2(0,1)


$num.to_i.times do |i|
    puts g.resume
    #puts fib(i)
end

