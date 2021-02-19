class News < ApplicationRecord
  validates :candleStick_id, presence: true
  validates :discription, presence: true
  
  belongs_to :candleStick, optional: true
end
