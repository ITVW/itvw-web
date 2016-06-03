class User < ActiveRecord::Base
  belongs_to :carrier
  
  # user carrier
  validates :carrier, presence: true
  
  # phone
  VALID_PHONE_NUM = /\A\d{8,15}\z/
  validates :phone,     presence: true,
                        length: {in: 8..15},
                        format: {with: VALID_PHONE_NUM},
                        uniqueness: true
  
  # nickname
  VALID_NICKNAME = /\A[a-zA-Z0-9]+\z/
  validates :nickname,  presence: true,
                        length: {in: 3..20},
                        format: {with: VALID_NICKNAME},
                        uniqueness: {case_sensitive: false}
end
