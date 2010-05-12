require 'spec_helper'

describe "encounters/index.html.haml" do
  before(:each) do
    assign(:encounters, [
      stub_model(Encounter,
        :name => "MyString"
      ),
      stub_model(Encounter,
        :name => "MyString"
      )
    ])
  end

  it "renders a list of encounters" do
    render
    response.should have_selector("tr>td", :content => "MyString".to_s, :count => 2)
  end
end
