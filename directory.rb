@students = []

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    name = gets.chomp.capitalize

  while !name.empty? do
    @students << {name: name, cohort: :november}
    
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else 
      puts "Now we have #{@students.count} students"
    end

    puts 'Please enter the name of the next student.'
    name = gets.chomp.capitalize
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

  def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
  end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit
  else 
    puts "I don't know what you meant, try again"
  end
end

def print_header
  puts " The students of Villains Academy ".center(50, '••••••••••')
  puts "-------------\n".center(50)
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  if @students.count == 1
    puts "\nOverall, we have #{@students.count} great student\n"
  else
    puts "\nOverall, we have #{@students.count} great students\n"
  end
end

interactive_menu