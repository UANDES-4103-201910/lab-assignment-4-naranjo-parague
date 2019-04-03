class Event < ApplicationRecord
  belongs_to :event_venue
  has_many :ticket_types


  validate :same_place
  validate :date_cannot_be_in_the_past


  def date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end

  def same_place
    event = Event.where(:event_venue => event_venue).where(:start_date => start_date).count()
    if event > 1
      errors.add(:event_venue, "can't have 2 events at the same venue and time")
    end
  end
end
