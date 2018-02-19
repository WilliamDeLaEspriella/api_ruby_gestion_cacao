class Producer < ApplicationRecord
    validates_presence_of :name, length: { minimum: 6 }
    has_one :user 
    has_one  :location, dependent: :destroy
    accepts_nested_attributes_for :location
    before_save {name.downcase!}
end
