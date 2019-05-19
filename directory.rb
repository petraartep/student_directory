@students = []

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    add_more_student(gets.strip.capitalize)
end

def add_student(name, cohort)
  @students << { name: name, cohort: cohort.to_sym} # hobbies: :coding
end

def add_more_student(name)
  while !name.empty? do
    add_student(name, add_cohort)
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else puts "Now we have #{@students.count} students"
    end
    puts 'Please enter the name of the next student.'
    name = gets.chomp.capitalize
  end
  @students
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
  if @students.count >= 1 
    @students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
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

=begin
def add_cohort
  months = [
    "January", "February", "March", "April", "May", "June", "July",
    "August", "September", "October", "November", "December"
  ]
  puts 'Please enter the cohort for the student'
  cohort = gets.chomp.capitalize
  if months.include?(cohort)
    return cohort.to_s
  else
    puts "Enter a valid month"
    add_cohort
  end
end

def add_groups
  cohorts = []
  @students.map { |student| cohorts << student[:cohort]}
  cohorts.uniq.each do |cohort| 
    puts "#{cohort}"
    @students.map do |student| 
      puts "#{student[:name]}" if student[:cohort] == cohort
    end
  end
end


def begin_names
  @students.each do |student|
    if student[:name].to_s.chr == "A"
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end 

def long_names
  @students.each do |student|
    if student[:name].length < 12
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def control_flow
  index = 0
  while index < @students.length
    student = @students[index]
    puts "#{student[:name]} (#{student[:cohort]} cohort) #{student[:hobbies]}"
    index += 1
  end
end

@students = input_students
if @students.count >= 1 
  print_header
  puts " List of Students ".center(50, '••••••••••')
  print_student_list
  puts " List by Cohorts ".center(50, '••••••••••')
  add_groups
  print_footer
else
  print_header
  puts "N/A".center(50)
end
=end