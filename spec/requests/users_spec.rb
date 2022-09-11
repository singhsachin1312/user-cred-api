require 'rails_helper'

RSpec.describe "Users", type: :request do

  before(:each) do |example|
    @current_user = []
    6.times do
      @current_user << create(:user)
    end
  end

  describe "GET /index" do
    it "Get default per page 3 users" do
      get "/api/users"
      data = JSON.parse(response.body)
      expect(data['users'].count).to eq(3)
      expect(response).to have_http_status(200)
    end

    it "Get users on page 2" do
      get "/api/users?page=2"
      data = JSON.parse(response.body)
      expect(data['users'].count).to eq(3)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /Show" do
    it "Get a particular user" do
      get "/api/user/#{@current_user.last.id}"
      data = JSON.parse(response.body)
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /Create User" do
    it "User created sucessfully" do
      post "/api/user", params: { user: { first_name: "jack", last_name: "Singh", email: "demotest1@yopmail.com"} }
      data = JSON.parse(response.body)
      expect(data['user']['first_name']).to eq("jack")
      expect(response).to have_http_status(200)
    end
  end

  describe "PUT /Update" do    
    it "When update attributes successfully" do
      put "/api/user/#{@current_user.last.id}", params: { user: { first_name: "testjohn", last_name: "demo", email: "demotest@yopmail.com"} }
      data = JSON.parse(response.body)
      expect(data['user']['first_name']).to eq("testjohn")
      expect(response).to have_http_status(200)
    end
  end

  describe "DELETE /destroy" do    
    it "When user delete successfully" do
      delete "/api/user/#{@current_user.last.id}"
      data = JSON.parse(response.body)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /typeahead" do    
    it "Search user with first name or last name or email" do
      get "/api/typeahead/in"
      data = JSON.parse(response.body)
      expect(response).to have_http_status(200)
    end
  end

  it 'when user not found' do 
    get "/api/user/119"
    data = JSON.parse(response.body)
    expect(data['success']).to eq(false)
    expect(data['message']).to eq('Not Found!')
  end
end
