class Character
  include Mongoid::Document

  field :name, :type => String
  field :base_initiative, :type => Integer
  field :encounter, :type => BSON::ObjectID
  
  embedded_in :campaign, :inverse_of => :characters
end
