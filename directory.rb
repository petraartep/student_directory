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
  puts "-------------"
end

def print_list(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_start(students)
  students.each do |student|
    if student[:name].to_s.chr == "A"
      puts "#{student[:name]} (#{student[:cohort]} cohort) "
    end
  end
end 

def print_length(students)
  students.each do |student|
    if student[:name].length < 12
      puts "#{student[:name]} (#{student[:cohort]} cohort) "
    end
  end
end



def print_footer(students)
  puts "\nOverall, we have #{students.count} great students"
end

students = input_students
print_header
print_list(students)
puts "start with"
print_start(students)
puts "length"
print_length(students)
print_footer(students)



