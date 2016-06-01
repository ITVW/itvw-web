class Vote < ActiveRecord::Base
  belongs_to :vaporwave
  belongs_to :user
end
