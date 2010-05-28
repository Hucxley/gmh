class Campaign
  include Mongoid::Document

  field :name, :type => String

  embeds_many :characters
  has_many_related :encounters
end
