# 定義四個動作
# 依序做完

module Action
  SEE = 1
  TOUCH = 2
  EAT = 3
  FINISH = 4
end

class Test
  include Action
  attr_accessor :var
  def initialize
    @var = Action::SEE
  end
  def process
    case @var
    when Action::SEE
      puts "i see something"
      doOtherThing
      doStep(2)
    when Action::TOUCH
      puts "i touch something"
      doOtherThing
      doStep(3)
    when Action::EAT
      puts "i eat something"
      doOtherThing
      doStep(4)
    else
      puts "finish"
    end
  end

  def doStep(x)
    @var = x
  end

  def doOtherThing
    puts "doOtherThing"
  end
end

obj = Test.new
# 一步一步做到完 共計4步
4.times do
    obj.process
end
