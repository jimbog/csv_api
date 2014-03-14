require 'spec_helper'
require 'csv'
require_relative '../lib/hashes_array'

describe HashesArray do
  let(:ha) { HashesArray.new ["#{__dir__}/support/people_pipe.csv"] }
  context "initialization" do 
    it 'creates an array' do
      expect(ha.arr).to be_kind_of Array
    end

    it 'contains hashes' do
      expect(ha.arr.first).to be_kind_of Hash
    end

    it 'contains right keys and values' do
      expect(ha.arr.first[:lastname]).to eq("Appleton")
    end

    context "passing multiple file paths" do
      let(:ha_multi_file) {
        HashesArray.new(
          ["#{__dir__}/support/people_pipe.csv",
           "#{__dir__}/support/people_comma.csv"]) }

      it "combines multiple files into an array" do
        expect(ha_multi_file.arr.count).to eq(6)
      end
    end
  end

  it "returns a sorted array" do
    expect(ha.sort_by(:lastname).first[:lastname]).to eq("Appleton")
    expect(ha.sort_by(:lastname).last[:lastname]).to eq("Watkins")
  end

  it "sorts the array in place" do
    ha.sort_by!(:lastname)
    expect(ha.arr.last[:lastname]).to eq("Watkins")
  end

  context "before converting a field to date" do
    it "is a string" do
      expect(ha.arr.first[:dateofbirth]).to be_kind_of String
    end
  end

  context "after converting a field to date" do
    it "returns a date" do
      ha.column_to_date('dateofbirth', '%m/%d/%Y')
      expect(ha.arr.first[:dateofbirth]).to be_kind_of Date
    end
  end

    it "formats a date according to the passed argument" do
      ha.column_to_date('dateofbirth', '%m/%d/%Y')
      ha.format_date('dateofbirth', '%m-%d-%Y')
      ha.arr.first[:dateofbirth].should match(/\d{1,2}\-\d{1,2}\-\d{4}/)
  end
end
