class RawOrder < ActiveRecord::Base
  belongs_to :csv_import
end
