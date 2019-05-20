require "csv"

@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to file"
  puts "4. Load the list from file}"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    puts "Input the students"
    input_students
  when "2"
    puts "Show the students"
    show_students
  when "3"
    puts "Save the list to file"
    save_students
  when "4"
    puts "Load the list from file"
    load_students
  when "9"
    puts "EXIT"
    exit
  else 
    puts "I don't know what you meant, try again"
  end
end

def add_students(name)
  @students << {name: name, cohort: :november}  # cohort.to_sym
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp

  while !name.empty? do
    add_students(name) # @students << {name: name, cohort: :november}
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else puts "Now we have #{@students.count} students"
    end
    puts 'Please enter the name of the next student.'
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_student_list
  print_footer
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
    puts "\nOverall, we have #{@students.count} great student"
  else
    puts "\nOverall, we have #{@students.count} great students"
  end
end

def save_students
  puts "Please enter the filename to save"
  filename = STDIN.gets.chomp
  CSV.open(filename, "wb") do |csv|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv << student_data
#      csv_line = student_data.join(",")
#      file.puts csv_line
    end
  end #  file.close
  puts "• • • #{filename} saved • • •"
end

def load_students(filename = "students.csv")
  puts "Please enter a filename to load"
    filename = STDIN.gets.chomp
#    CSV.open(filename, "r") do |csv|
#    File.readlines.each do |line|
     CSV.foreach(filename) do |row|
      name, cohort = row
#      name, cohort = line.chomp.split(',')
      add_students(name) # @students << {name: name, cohort: cohort.to_sym}
#      end
    end #  file.close
  puts "• • • #{filename} loaded • • •"
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  if filename.nil? # get out of the method if it isn't given
  elsif File.exist?(filename) # if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

try_load_students
interactive_menu