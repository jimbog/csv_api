require 'rubygems'
require 'grape'
require 'json'
require 'csv'
require 'rack/contrib'
require_relative '../lib/csv_extras'
require_relative '../lib/hashes_array'


class Test < Grape::API
  use Rack::JSONP
  version 'v1'
  format :json

  file_paths = "people_comma.csv people_pipe.csv people_space.csv"

  file_paths_arr = file_paths.split(' ').map do |file_path|
    File.expand_path("../#{file_path}", __FILE__)
  end

  myArr = HashesArray.new file_paths_arr
  myArr.column_to_date "DateOfBirth", "%m/%d/%Y"


  resource :records do
    get ':order' do
      return "#{myArr.sort_by!(params[:order]).to_json}"
    end

    post ':line' do
      line = params[:line]
      incoming = "#{__dir__}/incoming.csv"
      open(incoming, 'a') do |f|
        f.puts line
      end
    end
  end

end
