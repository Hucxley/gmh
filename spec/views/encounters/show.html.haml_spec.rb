require 'spec_helper'

describe "encounters/show.html.haml" do
  before(:each) do
    assign(:encounter, @encounter = stub_model(Encounter)
  end

  it "renders attributes in <p>" do
    render
  end
end
