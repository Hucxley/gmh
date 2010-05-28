class Character
  include Mongoid::Document

  field :name, :type => String
  field :initiative, :type => Integer
  field :encounter, :type => BSON::ObjectId
end
