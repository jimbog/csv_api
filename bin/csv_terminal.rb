require 'terminal-table'
require 'csv'
require_relative '../lib/csv_extras'
require_relative '../lib/hashes_array'

#get input file(s)
puts "Please enter the file name(s) separated by spaces, or just hit the enter key to load the default files"

file_paths = gets.chomp.downcase

if file_paths == ''
  #load default files
  file_paths = "people_comma.csv people_pipe.csv people_space.csv"
end

file_paths_arr = file_paths.split(' ').each do |file_path|
  File.expand_path("../#{file_path}", __FILE__)
end

def print_pretty_table(arr_of_hashes)
  arr = []
  arr_of_hashes.each {|row| arr << row.values}
  Terminal::Table.new headings: arr_of_hashes[0].keys, rows: arr
end

myArr = HashesArray.new file_paths_arr

puts print_pretty_table myArr.arr

puts "Output 1"
#the HashesArray methods take either strings or symbols
output1 = myArr.sort_by :gender, :lastname
puts print_pretty_table output1 

puts "Output 2"
myArr.column_to_date "DateOfBirth", "%m/%d/%Y"
myArr.sort_by! "DateOfBirth"
myArr.format_date "DateOfBirth", "%m/%d/%Y"
puts print_pretty_table myArr.arr 

puts "Output 3"
output3 = myArr.sort_by "LastName"
puts print_pretty_table output3 

