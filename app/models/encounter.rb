class Encounter
  include Mongoid::Document

  field :name, :type => String
  field :characters, :type => Array, :default => []

  belongs_to_related :campaign

  def initialize_characters(data)
    return if data.nil? || data.empty?

    data.each do |char, roll|
      character = caracters.select {|c| c.id == char.id}
      init = roll[:roll].to_i + char.initiative
      character.update_attributes(:initiative => init)
    end
  end
end
