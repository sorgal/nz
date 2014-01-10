require 'spec_helper'
require 'capybara/poltergeist'

Capybara.javascript_driver = :poltergeist

describe "the sign in and sign up process", :type => :feature, :js => true do
  before :each do
    random = rand(1000)
    @user = FactoryGirl.build(:user, :email => "user#{random}@user.com", :password => "1234567890").attributes
  end

  it "signs me up" do
    visit '/users/sign_up'
    within("#new_user") do
      fill_in 'user_email', :with => @user["email"]
      fill_in 'user_password', :with => "1234567890"
      fill_in 'user_password_confirmation', :with => "1234567890"
    end
    click_button 'Sign up'
    expect(page).to have_content 'Some protected text'
  end

  it "signs me in" do
    user = FactoryGirl.build(:user)
    visit '/users/sign_in'
    within("#new_user") do
      fill_in 'user_email', :with => user["email"]
      fill_in 'user_password', :with => "1234567890"
    end
    click_button 'Sign in'
    expect(page).to have_content 'Some protected text'
  end

end