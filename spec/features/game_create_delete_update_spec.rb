require 'spec_helper'

describe "Game delete update create", :type => :feature, :js => true do

  before(:each) do
    @game = FactoryGirl.create(:game).attributes
    game = Game.find(@game['id'])
    puts game
    game.should_not be_nil
    @random = rand(1000)
  end

  it "create game" do
    visit "/games/new"
    within("#new_game") do
      fill_in 'game_title', :with => "#{@game["title"]}#{@random}"
      fill_in 'game_start_date', :with => @game["start_date"]
      fill_in 'game_duration', :with => @game["duration"]
    end
    click_button 'Create Game'
    expect(page).to have_content @game["title"]
  end

  it "update game" do
    game = Game.first
    visit "/games/#{game[:id]}/edit"
    random = rand(1000)
    within("#edit_game_#{game[:id]}") do
      fill_in 'game_title', :with => "#{game[:title]}#{random}"
      fill_in 'game_start_date', :with => game[:start_date]
      fill_in 'game_duration', :with => game[:duration]
    end
    click_button 'Update Game'
    expect(page).to have_content game[:title]
  end

  it "delete game" do
    game = Game.first
    visit "/games/#{game[:id]}"
    click_link 'Delete'
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_no_content game[:title]
  end

end