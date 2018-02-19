class Location < ApplicationRecord
belongs_to :producer
validates_presence_of :latitude
validates_presence_of :longitude
end
