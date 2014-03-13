require 'terminal-table'
require 'csv'
require_relative '../lib/csv_extras'

#get input file
puts "Please enter the file name(s) separated by spaces, or type default"

file_paths = gets.chomp.downcase

if file_paths == 'default' or ''
  file_paths = "people_comma.csv people_pipe.csv people_space.csv"
end


  def combine_csv_files_into_hashes(file_paths)
     file_paths = file_paths.split(' ')
    arr = []
    file_paths.each do |file_path|
      file = CSV.open File.expand_path("../#{file_path}", __FILE__)

      arr << file.to_hashes
    end 
    arr.flatten
  end

myArr = combine_csv_files_into_hashes(file_paths)

def print_pretty_table(arr_of_hashes)
  arr = []
  arr_of_hashes.each {|row| arr << row.values}
  Terminal::Table.new headings: arr_of_hashes[0].keys, rows: arr
end

puts print_pretty_table myArr

def sort_table(arr, *params)
  arr.sort_by do |el|
    params.map { |param| el[param] }
  end
end

def column_to_date(hashes_array, column_name, format)
  hashes_array.each do |row|
    row[column_name] = Date.strptime(row[column_name],format)
    end
end

def format_date(hashes_array, column_name, format)
  hashes_array.each do |row|
    row[column_name] = row[column_name].strftime format
    end
end

column_to_date(myArr, "DateOfBirth", '%m/%d/%Y')


puts "Output 1"
puts print_pretty_table sort_table(myArr, "Gender", "LastName")

puts "Output 1"
output2 = sort_table(myArr, "DateOfBirth")
puts print_pretty_table format_date(output2, "DateOfBirth", '%m/%d/%Y')


puts "Output 3"
puts print_pretty_table sort_table(myArr, "LastName")
