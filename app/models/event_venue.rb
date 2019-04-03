class EventVenue < ApplicationRecord
  validates :name, length: { maximum: 20 }
  validates :capacity, numericality => { :greater_than_or_equal_to => 1}
end
