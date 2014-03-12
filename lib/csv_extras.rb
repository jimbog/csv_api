module CsvExtras

  def io_path
    @io.path
  end

  def auto_col_sep
    first_line = File.readlines(io_path).first
    if first_line.include? ','
      @col_sep = ','
    elsif first_line.include? '|'
      @col_sep = '|'
    elsif first_line.include? ' '
      @col_sep = ' '
    end
  end

  def to_hashes
    self.auto_col_sep
    contents = self.read
    arr = []
    headers = contents.first.map {|key| key }
    entries = contents[1..-1]
    entries.each { |row| arr << Hash[headers.zip(row)] }
    arr
  end


end

class CSV
  include CsvExtras
end
