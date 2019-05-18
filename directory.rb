# create an empty array
students = []

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
# get the first name    
    name = gets.chomp
# while the name is not empty repeat this code
    while !name.empty? do
# add the student hash to the array      
# The value of the cohort is hardcoded
      students << {name: name, cohort: :november, hobbies: hobbies}
      puts "Now we have #{students.count} students"
# get another name from user      
      name = gets.chomp.capitalize
    end
# return the array of students    
    students
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------" # "-------------"
end

# Ex 1 - print a number before the name of each student
def print_student_list(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)}"
  end
end

# Ex 2 - only print the students whose name begins with a specific letter
def print_start(students)
  students.each do |student|
    if student[:name].to_s.chr == "A"
      puts "#{student[:name]} (#{student[:cohort]} cohort) "
    end
  end
end 

# Ex 3 - only print the students whose name is shorter than 12 characters
def print_length(students)
  students.each do |student|
    if student[:name].length < 12
      puts "#{student[:name]} (#{student[:cohort]} cohort) "
    end
  end
end

# Ex 4 - prints all students using while or until control flow methods
def print_while(students)
  index = 0
  while index < students.length
    puts "#{students[index][:name]} (#{students[index][:cohort]} cohort)"
    index += 1
  end
end

# Ex 5 - Add more information: hobbies, country of birth, height, etc.
# Ex 6 - make the output beautifully aligned


def print_footer(students)
  puts "\nOverall, we have #{students.count} great students"
end

# instead of hardcoding the list of students, get it from the user
students = input_students
#nothing happens until we call the methods
print_header
puts "~~~~~~~~ Ex 1 - List ~~~~~~~~"
print_student_list(students)
puts "~~~~~~~~ Ex 2 - Start with ~~~~~~~~"
print_start(students)
puts "~~~~~~~~~~ Ex 3 - Length ~~~~~~~~~~"
print_length(students)
puts "~~~~~~~~~~ Ex 4 - While ~~~~~~~~~~"
print_while(students)

print_footer(students)
