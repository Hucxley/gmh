require 'spec_helper'

describe "campaigns/index.html.haml" do
  before(:each) do
    assign(:campaigns, [
      stub_model(Campaign,
        :name => "MyString"
      ),
      stub_model(Campaign,
        :name => "MyString"
      )
    ])
  end

  it "renders a list of campaigns" do
    render
    response.should have_selector("tr>td", :content => "MyString".to_s, :count => 2)
  end
end
