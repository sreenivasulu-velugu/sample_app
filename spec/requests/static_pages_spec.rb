require 'spec_helper'

describe "Static pages" do

  let(:base_title) { "Ruby on Rails Tutorial Sample App" }

  subject { page }

  describe "Home page" do
    before { visit root_path }
    it { should have_selector('h1', text: 'Sample App') }
    

    it { should have_selector('title',
                        text: full_title('')) }
    
    it { should_not have_selector('title', text: '| Home') }
    
  end

  describe "Help page" do
    
    before { visit help_path }
    
    it { should have_selector('h1', text: 'Help') }
    
    it { should have_selector('title', text: full_title('Help')) }
    
  end

  describe "About page" do

    before { visit about_path }
    
    it { should have_selector('h1', :text => 'About Us') }
    
    it { should have_selector('title', :text => full_title('About Us')) }
    
  end

  describe "Contact page" do

    before { visit contact_path }
    
    it { should have_selector('h1', :text => 'Contact') }
    
    it { should have_selector('title', :text => full_title('Contact')) }
    
  end

  describe "profile page" do
    # Code to make a user variable
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_selector('h1',    text: user.name) }
    it { should have_selector('title', text: user.name) }
  end
  
end
