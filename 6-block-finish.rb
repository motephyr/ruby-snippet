$isPoison = ARGV.first

module Action
  SEE = 1
  TOUCH = 2
  EAT = 3
  FINISH = 4
end


class Test
  include Action
  @@var = 1
  @@isPoison = $isPoison.nil? ? false : $isPoison
  def process
    case @@var
    when Action::SEE
      b = lambda do |x|
        puts x
      end
      1.upto(10) { |x| b.call(x)}
      1.upto(10, &b)
      1.upto(10) { |x|
        puts x
      }

      a = Proc.new do |x|
        puts "i see something"
        whatCanIdo(x)
      end


      doAction(a)      #I want do more thing after think!
    when Action::TOUCH
      b = proc do |x|
        puts "i touch something"
        research
        whatCanIdo(x)
      end
      doAction(b)
    when Action::EAT
      c = lambda do |x|
        puts "i eat something"
        whatCanIdo(x)
      end
      doAction(c)
    else
      puts "finish"
    end
  end

  def whatCanIdo(x)
    puts "i will do "+x.to_s+" step"
  end

  def doAction(a)
    think
    a.call(@@var+1)
    doNextStep
  end

  def putsxaa(x)
      yield x
  end

  def research
    puts "do some research"
    if @@isPoison
      puts "poison!! flee!!"
      run
    end
  end

  def think
    puts 'think'
  end

  def doNextStep
    @@var = @@var + 1
  end

  def run
    @@var = 4
  end

end

obj = Test.new
4.times do
  obj.process
end

