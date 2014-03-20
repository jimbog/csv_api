require 'spec_helper'
require 'rack/test'
require_relative '../bin/api'

include Rack::Test::Methods

def app
  CsvApi
end

describe 'Grape::API' do
  describe "GET /v1/records/lastname" do
    it "returns an object with data" do
      get "/v1/records/lastname"
      last_response.status.should == 200
      expect(last_response.body).to include("lastname")
    end
  end

  describe "POST /v1/records/newstuff" do
    it "receives and processes post requests" do
      post "/v1/records/newstuff"
      last_response.status.should == 201
    end
  end
end
