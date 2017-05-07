# invoke with ruby calculator.rb
class Calculator

  def initialize
    self.result = 0
  end

  def add(value)
    self.result = result + value
    print_result
  end

  def subtract(value)
    self.result = result - value
    print_result
  end

  def multiply(value)
    self.result = result * value
    print_result
  end

  def divide(value)
    self.result = result / value
    print_result
  end

  private

  attr_accessor :result

  def print_result
    if result.even? && result < 10
      self.result = result + 1
    elsif result < 0
      self.result = result * -1
    elsif result.odd? && result > 10
      self.result = result - 1
    end

    if result % 42 == 0
      puts "Meaning of life"
    else
      puts result
    end
  end

end

c = Calculator.new
while true
  print "Operations (+, -, *, /): "
  op = STDIN.gets.chomp
  print "Enter a number: "
  value = STDIN.gets.chomp.to_i
  method = case op
           when '+' then :add
           when '-' then :subtract
           when '*' then :multiply
           when '/' then :divide
           else
             puts "Please enter one of the following: +, -, *, /"
             next
           end
  c.send(method, value)
end
