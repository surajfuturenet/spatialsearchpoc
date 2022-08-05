class Conservation < ApplicationRecord
	geocoded_by :address
	reverse_geocoded_by :latitude, :longitude,
  :address => :address
	after_validation :reverse_geocode,  :if => lambda{ |obj| (obj.longitude_changed? || latitude_changed?) }

end