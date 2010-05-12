require 'spec_helper'

describe "encounters/new.html.haml" do
  before(:each) do
    assign(:encounter, stub_model(Encounter,
      :new_record? => true,
      :name => "MyString"
    ))
  end

  it "renders new encounter form" do
    render

    response.should have_selector("form", :action => encounters_path, :method => "post") do |form|
      form.should have_selector("input#encounter_name", :name => "encounter[name]")
    end
  end
end
