class Encounter
  include Mongoid::Document

  field :name, :type => String
  field :character_ids, :type => Array, :default => []
  field :monsters, :type => Array, :default => []

  belongs_to_related :campaign

  def initialize_characters(data)
    return if data.nil? || data.empty?

    data.each do |char, roll|
      character = caracters.select {|c| c.id == char.id}
      init = roll[:roll].to_i + char.initiative
      character.update_attributes(:initiative => init)
    end
  end

  def characters
    campaign.characters.where(:id.in => character_ids.map {|x| BSON::ObjectID.from_string(x)})
  end
end
