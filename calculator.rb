def prompt(msg)
  puts "=>#{msg}"
end

loop do
  prompt("Welcome to the Calculator")
  prompt("Enter the first number")
  
  num1 = Kernel.gets.chomp
  prompt("Enter the second number")
  num2 = Kernel.gets.chomp
  
  operator_prompt = <<-msg
      Which operation would you like to do: 
      1 for Add 
      2 for Subtract 
      3 for Multiply
      4 for Divide
  msg
  prompt(operator_prompt)
  
  operation = ''
  
  loop do
    operation = Kernel.gets.chomp
      if %w(1 2 3 4).include?(operation)
      break
      else puts "Please choose one of the four operators"
      end
  end
  
  case operation
  when "1"
    puts "Adding... #{num1} and #{num2}"
    puts num1.to_i + num2.to_i
  when "2"
    puts "Subtracting...#{num1} and #{num2}"
    puts num1.to_i - num2.to_i
  
  when "3"
    puts "Multiplying....#{num1} and #{num2}"
    puts num1.to_i*num2.to_i
  when "4"
    puts "Dividing...#{num1} and #{num2}"
    puts num1.to_f/num2.to_f
  end
  
  puts "Would you like to do another calculation (Y for yes)"
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')

end