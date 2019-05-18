# create an empty array
@students = []

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
# get the first name    
    name = gets.chomp.capitalize
    puts "Please enter the cohort of the student"
    cohort = gets.chomp.capitalize.to_sym

# while the name is not empty repeat this code
    while !name.empty? do
# add the student hash to the array      
      @students << {name: name, cohort: cohort, hobbies: :coding}
      puts "Now we have #{@students.count} students"
      puts "Please enter the names of the students"
# get another name from user      
      name = gets.chomp.capitalize
# Ex 7 - get input from user for cohort      
      puts "Please enter the cohort of the student"
      cohort = gets.chomp.capitalize.to_sym
    end
# return the array of students    
    @students
end

# Ex 6 - make the output beautifully aligned
def print_header
  puts " The students of Villains Academy ".center(50, '••••••••••')
  puts "-------------\n".center(50)
end

# Ex 1 - print a number before the name of each student
# Ex 5 - Add more information: hobbies, country of birth, height, etc.
# Ex 7 - Default cohort value if empty
def print_student_list
  @students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort].empty? ? "UNKNOWN" : student[:cohort]} cohort) hobbies: #{student[:hobbies]}"
  end
end

# Ex 2 - only print the students whose name begins with a specific letter
def print_start
  @students.each do |student|
    if student[:name].to_s.chr == "A"
      puts "#{student[:name]} (#{student[:cohort].empty? ? "UNKNOWN" : student[:cohort]} cohort)"
    end
  end
end 

# Ex 3 - only print the students whose name is shorter than 12 characters
def print_length
  @students.each do |student|
    if student[:name].length < 12
      puts "#{student[:name]} (#{student[:cohort].empty? ? "UNKNOWN" : student[:cohort]} cohort)"
    end
  end
end

# Ex 4 - prints all students using while or until control flow methods
def print_while
  index = 0
  while index < @students.length
    student = @students[index]
    puts "#{student[:name]} (#{student[:cohort].empty? ? "UNKNOWN" : student[:cohort]} cohort)"
    index += 1
  end
end

def print_footer
  puts "\nOverall, we have #{@students.count} great students"
end

# instead of hardcoding the list of students, get it from the user
@students = input_students
#nothing happens until we call the methods
print_header
puts " Ex 1 - List ".center(50, '••••••••••')
print_student_list
puts " Ex 2 - Start with A".center(50, '••••••••••')
print_start
puts " Ex 3 - Length ".center(50, '••••••••••')
print_length
puts " Ex 4 - While ".center(50, '••••••••••')
print_while
print_footer
