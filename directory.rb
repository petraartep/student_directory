@students = []

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    name = gets.chomp

  while !name.empty? do
    @students << {name: name, cohort: :november}
    
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else 
      puts "Now we have #{@students.count} students"
    end

    puts 'Please enter the name of the next student.'
    name = gets.chomp
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
    puts "3. Save the list to students.csv"
    puts "4. Load the list from students.csv"
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
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else 
    puts "I don't know what you meant, try again"
  end
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
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
