require_relative 'csv_extras'
class HashesArray
  attr_reader :arr
  def initialize(file_paths_arr)
    @file_paths = file_paths_arr
    @arr = []

    combine_csv_files_into_hashes = lambda do
      arr = []
      @file_paths.each do |file_path|
        file = CSV.open file_path
        arr << file.to_hashes
      end 
      arr.flatten
    end

    @arr = combine_csv_files_into_hashes.call()
  end

  def sort_by(*params) #maps to a sorted array
    @arr.sort_by do |el|
      params.map { |param| el[param.downcase.to_sym] }
    end
  end

  def sort_by!(*params) #sorts @arr in place
    @arr.sort_by! do |el|
      params.map { |param| el[param.downcase.to_sym] }
    end
  end

  def column_to_date(column_name, format)
    column_name = column_name.downcase.to_sym
    @arr.map do |row|
      row[column_name] = Date.strptime(row[column_name],format)
    end
  end

  def format_date(column_name, format)
    column_name = column_name.downcase.to_sym
    @arr.each do |row|
      row[column_name] = row[column_name].strftime format
    end
  end
end
