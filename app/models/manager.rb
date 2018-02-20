class Manager < ApplicationRecord
    validates :appointment,presence: true
    validates :email,presence: true
    validates :name,presence: true
    validates :telephone,presence: true
    belong_to :association
end
