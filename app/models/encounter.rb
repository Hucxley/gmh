class Encounter
  include Mongoid::Document

  field :name, :type => String
  field :characters, :type => Array

  belongs_to_related :campaign
end
