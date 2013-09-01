# 將相同的邏輯抽出

module Action
  SEE = 1
  TOUCH = 2
  EAT = 3
  FINISH = 4
end


class Test
  include Action
  @@var = 1
  def process
    case @@var
    when Action::SEE
      puts "i see something"
      doTheSameAction
    when Action::TOUCH
      puts "i touch something"
      doTheSameAction
    when Action::EAT
      puts "i eat something"
      doTheSameAction
    else
      puts "finish"
    end
  end

  def doTheSameAction
    doOtherThing
    doNextStep()
  end

  def doNextStep()
    @@var = @@var + 1
  end

  def doOtherThing
    puts 'doOtherThing'
  end
end

obj = Test.new
4.times do
  obj.process
end
