class Location < ApplicationRecord
belongs_to :producer
belongs_to :association
validates_presence_of :latitude
validates_presence_of :longitude
end
