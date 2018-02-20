class ManagerSerializer < ActiveModel::Serializer
  attributes  :appointment, :email, :name, :telephone
end
