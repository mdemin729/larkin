class DailySchedule < ActiveRecord::Base
  has_many :loads

  validates :delivery_date, uniqueness: true
end
