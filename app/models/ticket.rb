class Ticket < ApplicationRecord
  belongs_to :ticket_type
  belongs_to :order

  before_save :ticket_future_event
  before_save :ticket_do_not_sell_after_event

  def ticket_future_event
    event = self.ticket_type.event
    #event = Event.find(event.id)
    if event.start_date < Date.today()
      errors.add("can't sell a ticket for an event that already happened")
    end
  end

  def ticket_do_not_sell_after_event
    event = self.ticket_type.event
    if event.start_date < Date.today()
      errors.add("can't sell a ticket for an event that already happened")
    end
  end

end
