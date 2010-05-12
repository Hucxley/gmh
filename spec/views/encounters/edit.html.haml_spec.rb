require 'spec_helper'

describe "encounters/edit.html.haml" do
  before(:each) do
    assign(:encounter, @encounter = stub_model(Encounter,
      :new_record? => false,
      :name => "MyString"
    ))
  end

  it "renders the edit encounter form" do
    render

    response.should have_selector("form", :action => encounter_path(@encounter), :method => "post") do |form|
      form.should have_selector("input#encounter_name", :name => "encounter[name]")
    end
  end
end
