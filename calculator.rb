# Calculator: Lesson 2: Small Programs: Bonus Features added
require 'yaml'
MESSAGES = YAML.load_file('calc_msgs.yml')

def messages(lang, message)
  MESSAGES[lang][message]
end

def prompt(lang, key)
  message = messages(lang, key)
  Kernel.puts("\n => #{message}")
end

def integer?(num)
  num.to_i.to_s == num # integer validation
end

def float?(float)
  float.to_f.to_s == float # float validation
end

def input(lan)
  number = Kernel.gets.chomp
  loop do
    if integer?(number) || float?(number)
      return number
    else
      prompt(lan, 'valid_num')
    end
  end
end

lang = ''

loop do
  puts "=> Choose language -> En for English and Hi for Hindi"

  puts "\n => भाषा चुनें -> अंग्रेजी के लिए En और हिंदी के लिए Hi"

  lang = ''
  loop do
    lang = gets.chomp.downcase
    if lang == 'en' || lang == 'hi'
      break
    else
      puts 'Please choose one of the languages En/Hi'
    end
  end
  prompt(lang, 'welcome')

  prompt(lang, 'first_num')
  num1 = input(lang)

  prompt(lang, 'second_num')
  num2 = input(lang)

  prompt(lang, 'op_msg')

  operation = ''

  loop do
    operation = Kernel.gets.chomp
    break if %w[1 2 3 4].include?(operation)

    prompt(lang, 'valid_op')
  end

  case operation
  when '1'
    print "\n#{num1} + #{num2} = ", format('%.2f', num1.to_f + num2.to_f)
  when '2'
    print "\n#{num1} - #{num2} = ", format('%.2f', num1.to_f - num2.to_f)
  when '3'
    print "\n#{num1} x #{num2} = ", format('%.2f', num1.to_f * num2.to_f)
  when '4'
    print "\n#{num1} / #{num2} = ", format('%.2f', num1.to_f / num2.to_f)
  end

  prompt(lang, 'repeat_calc')
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end

prompt(lang, 'thank_you')
