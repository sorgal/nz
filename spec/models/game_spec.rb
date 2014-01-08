require 'spec_helper'

describe Game do
  it "games validation checking" do
    game_1 = FactoryGirl.create(:game)
    game_2 = FactoryGirl.build(:article,
                               :title=> "")

    game_1.should be_valid
    game_2.should_not be_valid
  end
end
