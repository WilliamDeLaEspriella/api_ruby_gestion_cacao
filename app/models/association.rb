class Association < ApplicationRecord
    validates :description,presence: true
    validates :name,presence: true
    has_many :producers
    has_one :manager
    has_one :user
    has_one  :manager, dependent: :destroy
    accepts_nested_attributes_for :manager
    has_one  :location, dependent: :destroy
    accepts_nested_attributes_for :location
    before_save {name.downcase!}
end
