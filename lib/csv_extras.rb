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

end

class CSV
  include CsvExtras
end
