# create an empty array
@students = []

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    add_more_student(gets.strip.capitalize)
end

def add_student(name, cohort)
  @students << {name: name, cohort: cohort.to_sym, hobbies: :coding}
end

def add_more_student(name)
  while !name.empty? do
# add the student hash to the array 
    add_student(name, add_cohort)
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else puts "Now we have #{@students.count} students"
    end
# get another name from user      
    puts 'Please enter the name of the next student.'
    name = gets.chomp.capitalize
  end
# return the array of students    
  @students
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
      puts " • #{student[:name]}" if student[:cohort] == cohort
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

def short_names
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
#nothing happens until we call the methods
if @students.count >= 1 
  print_header
  puts " List of Students ".center(50, '••••••••••')
  print_student_list
  puts " List by Cohorts ".center(50, '••••••••••')
  add_groups
  puts " Names start with A ".center(50, '••••••••••')
  begin_names
  puts " Names shorter than 12 chr ".center(50, '••••••••••')
  short_names
  puts " Ex 4 - Control Flow ".center(50, '••••••••••')
  control_flow	  
  print_footer
else
  print_header
  puts "N/A".center(50)
end
