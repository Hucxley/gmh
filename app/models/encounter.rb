class Encounter
  include Mongoid::Document

  field :name, :type => String
  field :character_ids, :type => Array, :default => []
  field :monsters, :type => Array, :default => []
  field :round, :type => Integer, :default => 1

  belongs_to_related :campaign

  def initialize_characters(data)
    return if data.nil? || data.empty?

    data.each do |char_id, roll|
      character = characters.detect {|c| c.id == char_id}
      init = roll[:roll].to_i + character.base_initiative
      character.update_attributes(:current_initiative => init)
    end
  end

  def update_characters(updated_characters)
    return if characters.nil? || characters.empty?

    updated_characters.each do |char_id, attributes|
      character = characters.detect {|c| c.id == char_id}
      character.update_attributes(attributes)
    end
  end

  def characters
    campaign.characters.find(:all).select {|x| character_ids.include?(x.id)}
  end
end
