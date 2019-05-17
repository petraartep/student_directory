def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp.capitalize

  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp.capitalize
  end
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end

# step 1
def print_list(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

# step 2
def print_start(students)
  students.each do |student|
    if student[:name].to_s.chr == "A"
      puts "#{student[:name]} (#{student[:cohort]} cohort) "
    end
  end
end 

# step 3
def print_length(students)
  students.each do |student|
    if student[:name].length < 12
      puts "#{student[:name]} (#{student[:cohort]} cohort) "
    end
  end
end

# step 4
def print_while(students)
  index = 0
  while index < students.length
    puts "#{students[index][:name]} (#{students[index][:cohort]} cohort)"
    index += 1
  end
end

# step 5



def print_footer(students)
  puts "\nOverall, we have #{students.count} great students"
end

students = input_students
print_header
puts "~~~~~~~~ Step 1 - List ~~~~~~~~"
print_list(students)
puts "~~~~~~~~ Step 2 - Start with ~~~~~~~~"
print_start(students)
puts "~~~~~~~~~~ Step 3 - Length ~~~~~~~~~~"
print_length(students)
puts "~~~~~~~~~~ Step 4 - While ~~~~~~~~~~"
print_while(students)
print_footer(students)
