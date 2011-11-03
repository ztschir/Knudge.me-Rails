require 'spec_helper' 
describe "LayoutLinks" do
  it "should have a Home page at '/'" do 
    get '/'
    response.should have_selector('title', :content => "Home")
  end
  it "should have a Contact page at '/team'" do
    get '/team'
    response.should have_selector('title', :content => "Team")
  end
  it "should have a signup page at '/signup'" do
      get '/signup'
      response.should have_selector('title', :content => "Sign up")
  end
end
