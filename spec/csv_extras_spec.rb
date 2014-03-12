require 'spec_helper'
require 'csv'
require_relative '../lib/csv_extras.rb'

pipe_file = CSV.open(File.expand_path('../support/people_pipe.csv', __FILE__))

describe CsvExtras do
  class DummyClass
  end
  before(:all) do
    @dummy = DummyClass.new
    @dummy.extend CsvExtras
  end

  describe "io_path" do
    it "provides the path of the file" do
      expect(pipe_file).to respond_to(:io_path)
      expect(pipe_file.io_path).to eq(File.expand_path('../support/people_pipe.csv', __FILE__))
    end
  end

  describe "auto_col_sep" do
    it "is present" do
      expect(pipe_file).to respond_to(:auto_col_sep)
    end
    it "sets the column separator" do
      expect(pipe_file.auto_col_sep).to eq('|')
      expect(pipe_file.instance_variable_get('@col_sep')).to eq('|')
    end
  end
end
