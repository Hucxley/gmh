class Ability
  include Mongoid::Document

  field :name, :type => String
  field :base_score, :type => Integer
end
