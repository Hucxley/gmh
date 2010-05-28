require 'spec_helper'

describe "campaigns/new.html.haml" do
  before(:each) do
    assign(:campaign, stub_model(Campaign,
      :new_record? => true,
      :name => "MyString"
    ))
  end

  it "renders new campaign form" do
    render

    response.should have_selector("form", :action => campaigns_path, :method => "post") do |form|
      form.should have_selector("input#campaign_name", :name => "campaign[name]")
    end
  end
end
