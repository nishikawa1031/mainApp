# app/models/virtual_person.rb
class VirtualPerson
    include ActiveModel::Model
  
    attr_accessor :id, :name, :user_id, :creater_id, :created_at, :updated_at
  
    def persisted?
      true
    end
end
  