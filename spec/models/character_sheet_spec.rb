require 'spec_helper'

describe CharacterSheet do

  describe "initialize" do
    it "should set exactly six abilities" do
      CharacterSheet.new({}).abilities.size.should == 6
    end

    it "should default all ability scores to 8" do
      CharacterSheet.new({}).abilities.map(&:base_score).should == [8,8,8,8,8,8]
    end

    it "should still set ability score if given" do
      CharacterSheet.new(:str => 18).str.should == 18
    end
  end

end
