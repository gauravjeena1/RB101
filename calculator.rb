#Calculator: Lesson 2: Small Programs: Bonus Features added

LANGUAGE = 'en' #setting default language to English
puts "=> Which language would you like to use \nEn for English and Hi for Hindi"
puts ''
puts "=> आप किस भाषा में  का प्रयोग करना चाहेंगे अंग्रेजी/हिंदी\nअंग्रेजी के लिए En और जी के लिए En और हिंदी के लिए Hi"
lan = gets.chomp.downcase!

if lan == "Hi"
LANGUAGE = 'hi'
else
  LANGUAGE = 'en'
end

require 'yaml'
MESSAGES = YAML.load_file('calc_msgs.yml')


def integer?(num)
  num.to_i.to_s == num #integer validation
end

def float?(float)
  float.to_f.to_s == float  #float validation
end

def prompt(msg)
  puts "=>#{msg}"
end

loop do
  prompt(MESSAGES['welcome'])
  prompt( MESSAGES['first_num'])

  num1 = ''
  loop do
    num1 = Kernel.gets.chomp
    if (integer?(num1)) || (float?(num1))
      break
    else
      puts MESSAGES['valid_num']
    end
  end

prompt(MESSAGES['second_num'])
num2 = ''

  loop do
    num2 = Kernel.gets.chomp
      if (integer?(num2)) || (float?(num2))
        break
      else
        puts (MESSAGES['valid_num'])
      end
  end
  # operator_prompt = <<-MSG
  #     Which operation would you like to do:
  #     1 for Add
  #     2 for Subtract
  #     3 for Multiply
  #     4 for Divide
  # MSG
  prompt(MESSAGES['op_msg'])

operation = ''

  loop do
    operation = Kernel.gets.chomp
    break if %w[1 2 3 4].include?(operation)
    puts (MESSAGES['valid_op'])
  
  end

  case operation
    when '1'
      print "...#{num1} #{num2} "
      puts (MESSAGES['add_op'])
      puts num1.to_i + num2.to_i
    when '2'
      print "...#{num1} #{num2} "
      puts (MESSAGES['subtract_op'])
      puts num1.to_i - num2.to_i
  
    when '3'
      print "...#{num1} and #{num2} "
      puts (MESSAGES['multiply_op'])
      puts num1.to_i * num2.to_i
    when '4'
      print (MESSAGES['divide_op'])
      puts "...#{num1} and #{num2}"
      puts num1.to_f / num2.to_f
  end
  
    puts (MESSAGES['repeat_calc'])
    answer = gets.chomp.downcase
    break unless answer.start_with?('y')
end