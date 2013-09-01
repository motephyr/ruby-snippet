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
      a = Proc.new{puts "i see something"} #單行時使用 { }
      doAction(a)      
    when Action::TOUCH
      b = lambda do                        #多行時使用 do...end
        puts "i touch something"
        research              #I want do more thing after think!
      end
      doAction(b)
    when Action::EAT
      c = proc{puts "i eat something"}
      doAction(c)
    else
      puts "finish"
    end
  end


  def doAction(a)
    think
    a.call
    doNextStep
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


