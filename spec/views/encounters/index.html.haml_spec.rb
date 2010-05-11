require 'spec_helper'

describe "encounters/index.html.haml" do
  before(:each) do
    assign(:encounters, [
      stub_model(Encounter),
      stub_model(Encounter)
    ])
  end

  it "renders a list of encounters" do
    render
  end
end
