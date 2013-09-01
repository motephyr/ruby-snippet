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
      puts "i see something"
      doTheSameAction      
    when Action::TOUCH
      puts "i touch something"
      doTheSameAction      #I want do more thing after think!
    when Action::EAT
      puts "i eat something"
      doTheSameAction
    else
      puts "finish"
    end
  end

  def doTheSameAction
    think
    research # i want do research, but if I do that,I mush define another method for "doTheSameAction"
    doNextStep
  end

  def research
    puts "do some research"
    if @@isPoison
      puts "flee"
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
