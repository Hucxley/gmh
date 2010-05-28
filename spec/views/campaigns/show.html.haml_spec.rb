require 'spec_helper'

describe "campaigns/show.html.haml" do
  before(:each) do
    assign(:campaign, @campaign = stub_model(Campaign,
      :name => "MyString"
    ))
  end

  it "renders attributes in <p>" do
    render
    response.should contain("MyString")
  end
end
