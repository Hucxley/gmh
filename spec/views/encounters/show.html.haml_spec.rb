require 'spec_helper'

describe "encounters/show.html.haml" do
  before(:each) do
    assign(:encounter, @encounter = stub_model(Encounter,
      :name => "MyString"
    ))
  end

  it "renders attributes in <p>" do
    render
    response.should contain("MyString")
  end
end
