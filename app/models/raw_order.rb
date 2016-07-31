class RawOrder < ActiveRecord::Base
  belongs_to :csv_import
  validates :csv_import, presence: true

  validates_presence_of :delivery_date
  validates :delivery_shift, inclusion: {in: %w(M N E)}, allow_blank: true

  validates_presence_of :origin_name, :origin_raw_line_1, :origin_city, :origin_state, :origin_zip, :origin_country
  validates_presence_of :client_name, :destination_raw_line_1, :destination_city, :destination_state, :destination_zip, :destination_country

  validates :origin_zip, :destination_zip, format: {with: /\d{5}/}
  validates :phone_number, format: {with: /(\d.)?\d{3}.\d{3}.\d{4}( x.*)?/, message: 'wrong phone number format'}
  validates :purchase_order_number, format: {with: /\d{9}/}
end
