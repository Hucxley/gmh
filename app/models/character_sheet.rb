class CharacterSheet
  include Mongoid::Document

  field :name, :type => String
  field :level, :type => Integer, :default => 1
  field :initiative, :type => Integer

  #embeds_one :character_class
  embeds_many :skills
  embeds_many :abilities do
    def str
      @target.detect { |a| a.name == "str"}
    end
    def dex
      @target.detect { |a| a.name == "dex"}
    end
    def con
      @target.detect { |a| a.name == "con"}
    end
    def int
      @target.detect { |a| a.name == "int"}
    end
    def wis
      @target.detect { |a| a.name == "wis"}
    end
    def cha
      @target.detect { |a| a.name == "cha"}
    end
  end

  def initialize(params)
    #abilities ||= []
    super(params)
    abilities.create(:name => "str", :base_score => 8)
    abilities.create(:name => "dex", :base_score => 8)
    abilities.create(:name => "con", :base_score => 8)
    abilities.create(:name => "int", :base_score => 8)
    abilities.create(:name => "wis", :base_score => 8)
    abilities.create(:name => "cha", :base_score => 8)
  end
end
