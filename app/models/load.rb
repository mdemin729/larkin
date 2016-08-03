class Load < ActiveRecord::Base
  belongs_to :driver

  validates_presence_of :delivery_date, :driver
  validates :delivery_shift, inclusion: {in: %w(M N E)}, allow_blank: false
end
