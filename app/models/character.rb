class Character
  include MongoMapper::Document

  key :name, String
  key :initiative, Integer
end
