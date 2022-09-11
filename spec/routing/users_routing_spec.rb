require "rails_helper"

RSpec.describe "routes for index", :type => :routing do
  describe 'GET index routes' do
    it "routes /index to the users controller" do
      expect(get("/api/users")).to route_to("api/users#index")
    end
  end

  describe 'GET show routes' do
    it "routes /show to the users controller" do
      expect(:get => "/api/user/4").
      to route_to(:controller => "api/users", :action => "show", "id"=>"4")
    end
  end

  describe 'POST create routes' do
    it "routes /create to the users controller" do
      expect(:post => "/api/user").
      to route_to(:controller => "api/users", :action => "create")
    end
  end

  describe 'PUT update routes' do
    it "routes /update to the users controller" do
      expect(:put => "/api/user/2").
      to route_to(:controller => "api/users", :action => "update", "id"=>"2")
    end
  end

  describe 'DELETE destroy routes' do
    it "routes /destroy to the users controller" do
      expect(:delete => "/api/user/2").
      to route_to(:controller => "api/users", :action => "destroy", "id"=>"2")
    end
  end

  describe 'GET typeahead routes' do
    it "routes /typeahead to the users controller" do
      expect(:get => "/api/typeahead/in").
      to route_to(:controller => "api/users", :action => "typeahead", "input"=>"in")
    end
  end
end
