require 'spec_helper'

describe "encounters/new.html.haml" do
  before(:each) do
    assign(:encounter, stub_model(Encounter,
      :new_record? => true
    ))
  end

  it "renders new encounter form" do
    render

    response.should have_selector("form", :action => encounters_path, :method => "post") do |form|
    end
  end
end
