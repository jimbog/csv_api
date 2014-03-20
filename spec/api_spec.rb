require 'spec_helper'
require 'rack/test'
require_relative '../bin/api'

#describe Grape::API do
  include Rack::Test::Methods

  def app
    CsvApi
  end

  describe 'Grape::API' do
    describe "GET /v1/records/lastname" do
      it "returns an empty array of statuses" do
        get "/v1/records/lastname"
        last_response.status.should == 200
        expect(last_response.body).to include("lastname")
      end
    end
  end
#end
