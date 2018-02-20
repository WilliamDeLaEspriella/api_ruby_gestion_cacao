class AssociationSerializer < ActiveModel::Serializer
  attributes :producer_id, :user_id, :description, :location_id, :manager_id, :name
  has_many :producers
  has_one :manager
  has_one :location
end
