class Game < ActiveRecord::Base
  validate :title, :start_date, :duration, presence: true
end
