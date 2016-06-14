class Session < ActiveRecord::Base
  belongs_to :user
  
  # session user
  validates :user, presence: true
  
end
