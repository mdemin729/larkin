class Load < ActiveRecord::Base
  belongs_to :daily_schedule
  belongs_to :driver
  has_many :orders

  validates_presence_of :daily_schedule, :driver
  validates :delivery_shift, inclusion: {in: %w(M N E)}, allow_blank: false
end
