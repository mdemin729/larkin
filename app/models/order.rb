class Order < ActiveRecord::Base
  belongs_to :raw_order
end
