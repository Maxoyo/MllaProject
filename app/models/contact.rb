require 'rails/mongoid'
class Contact
  include Mongoid::Document
  field :first_name, type: String
  field :last_name, type: String
  field :age, type: Integer
end