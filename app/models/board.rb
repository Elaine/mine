class Board < ActiveRecord::Base
  belongs_to :board_category
  belongs_to :user
end
