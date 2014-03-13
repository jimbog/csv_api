require 'spec_helper'
require_relative '../bin/csv_terminal'

file_pipe = File.expand_path('../support/people_pipe.csv', __FILE__)
file_space = File.expand_path('../support/people_space.csv', __FILE__)
file_paths = file_pipe + file_space 

describe TerminalInteraction do
class DummyClass;end
  before(:all) do

    @dummy = DummyClass.new
    @dummy.extend TerminalInteraction
  end

  describe "combine_multiple_into_hashes" do
    it "creates an array of paths" do
      expect(@dummy).to respond_to(:combine_csv_files_into_hashes)

expect(@dummy.combine_csv_files_into_hashes(file_paths)).to be_kind_of(Array)

    end
  end
  
end
