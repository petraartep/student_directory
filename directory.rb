@students = []

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    add_more_student(gets.strip.capitalize)
end

def add_student(name, cohort)
  @students << { name: name, cohort: cohort.to_sym, hobbies: :coding}
end

def print_students_list
  @students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def add_more_student(name)
  while !name.empty? do
    add_student(name, add_cohort)
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else puts "Now we have #{@students.count} students"
    end
    puts 'Please enter the name of the next student.'
    name = gets.strip.capitalize
  end
  @students
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

def print_header
  puts " The students of Villains Academy ".center(50, '••••••••••')
  puts "-------------\n".center(50)
end

def print_footer
  if @students.count == 1
    puts "\nOverall, we have #{@students.count} great student\n"
  else
    puts "\nOverall, we have #{@students.count} great students\n"
  end
end

@students = input_students
print_header
puts " Ex 1 - List ".center(50, '••••••••••')
print_students_list
puts " Ex 2 - Begin with A ".center(50, '••••••••••')
begin_names
puts " Ex 3 - Greater than 12 chr ".center(50, '••••••••••')
long_names
puts " Ex 4 - Control Flow ".center(50, '••••••••••')
control_flow
puts " Ex 8 - Groups ".center(50, '••••••••••')
add_groups
print_footer
