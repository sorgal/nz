require 'spec_helper'

describe Article do
  #pending "add some examples to (or delete) #{__FILE__}"
  #user = FactoryGirl.create(:user, :username => "jdoe", :password => "secret")
  it "articles validation checking" do
    article_1 = FactoryGirl.create(:article, :title=> "test_article_title_1", :content => "test_article_content_1")
    article_2 = FactoryGirl.build(:article, :title=> "test_article_title_1", :content => "test_article_content_2")
    article_3 = FactoryGirl.build(:article, :title=> "1234567890", :content => "test_article_content_3")
    article_4 = FactoryGirl.build(:article, :title=> "1", :content => "test_article_content_4")
    article_5 = FactoryGirl.build(:article, :title=> "", :content => "")

    article_1.should be_valid
    article_2.should_not be_valid
    article_3.should be_valid
    article_4.should_not be_valid
    article_5.should_not be_valid
  end
end
