require 'rubygems'
require 'grape'
require 'json'
require 'csv'
require_relative '../lib/csv_extras'
require_relative '../lib/hashes_array'


class Test < Grape::API
  version 'v1'
  format :json

  file_paths = "people_comma.csv people_pipe.csv people_space.csv"

  file_paths_arr = file_paths.split(' ').map do |file_path|
    File.expand_path("../#{file_path}", __FILE__)
  end

  myArr = HashesArray.new file_paths_arr

  resource :records do
    get ':order' do
      myArr.sort_by! params[:order] 
    end

    post ':line' do
      new_record = params[:line]
      myArr.arr << new_record
    end
  end

end
