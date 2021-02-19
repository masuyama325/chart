class CandleStick < ApplicationRecord
    has_many :news
    belongs_to :user, optional: true
end
