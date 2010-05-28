require 'spec_helper'

describe "campaigns/edit.html.haml" do
  before(:each) do
    assign(:campaign, @campaign = stub_model(Campaign,
      :new_record? => false,
      :name => "MyString"
    ))
  end

  it "renders the edit campaign form" do
    render

    response.should have_selector("form", :action => campaign_path(@campaign), :method => "post") do |form|
      form.should have_selector("input#campaign_name", :name => "campaign[name]")
    end
  end
end
