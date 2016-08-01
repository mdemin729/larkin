class RawOrder < ActiveRecord::Base
  belongs_to :csv_import
  validates :csv_import, presence: true

  validate do |raw_order|
    begin
      Date.strptime raw_order.delivery_date, '%m/%d/%Y' unless raw_order.delivery_date.nil?
    rescue ArgumentError
      errors[:delivery_date] << 'must be valid date in MM/DD/YYYY format'
    end
  end

  validates_presence_of :delivery_date
  validates :delivery_shift, inclusion: {in: %w(M N E)}, allow_blank: true

  validates_presence_of :origin_name, :origin_raw_line_1, :origin_city, :origin_state, :origin_zip, :origin_country
  validates_presence_of :client_name, :destination_raw_line_1, :destination_city, :destination_state, :destination_zip, :destination_country

  validates :origin_country, :destination_country, inclusion: {in: %w(US)}, allow_blank: true
  validates :handling_unit_type, inclusion: {in: %w(box)}
  validates :origin_state, :destination_state,
            inclusion: {
                in: %w(AL	AK	AZ	AR	CA	CO	CT	DE	FL	GA	HI	ID	IL	IN	IA	KS	KY	LA	ME	MD	MA	MI	MN	MS	MO	MT	NE	NV	NH	NJ	NM	NY	NC	ND	OH	OK	OR	PA	RI	SC	SD	TN	TX	UT	VT	VA	WA	WV	WI	WY),
                message: 'must be US state abbreviation'
            }, allow_blank: true
  validates :origin_zip, :destination_zip, format: {with: /\A\d{5}\z/}, allow_blank: true

  validates :phone_number, format: {with: /\A(\d-)?.?\d{3}.\d{3}.\d{4}( x\d*)?\z/, message: 'wrong phone number format'}
  validates :purchase_order_number, format: {with: /\A\d{9}.*\z/}
  validates :volume, numericality: {less_than_or_equal_to: 1400}
  validates :handling_unit_quantity, numericality: {greater_than: 0}
end
