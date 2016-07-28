class CsvImport < ActiveRecord::Base
  mount_uploader :csv, CsvUploader
  validates_presence_of :csv
  has_many :raw_orders
end
