class Event < ActiveRecord::Base

  validates :start_date, :end_date, presence: true

end