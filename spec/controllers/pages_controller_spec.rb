require 'spec_helper'

describe PagesController do

# Home Page checks
  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.should be_success
    end
  end

# Team Page checks
  describe "GET 'team'" do
    it "should be successful" do
      get 'team'
      response.should be_success
    end
   
  end

end
