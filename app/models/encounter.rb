class Encounter
  include Mongoid::Document

  field :name, :type => String
  field :character_ids, :type => Array, :default => []
  field :monsters, :type => Array, :default => []

  belongs_to_related :campaign

  def initialize_characters(data)
    return if data.nil? || data.empty?

    data.each do |char_id, roll|
      character = characters.find(char_id).first
      init = roll[:roll].to_i + character.base_initiative
      character.update_attributes(:initiative => init)
    end
  end

  def characters
    campaign.characters.find(:all).select {|x| character_ids.include?(x.id)}
  end
end
