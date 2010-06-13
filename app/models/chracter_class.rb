class CharacterClass
  include Mongoid::Document

  field :name, :type => String

  #embedded_in :character_sheet, :inverse_of => :character_sheet
end
