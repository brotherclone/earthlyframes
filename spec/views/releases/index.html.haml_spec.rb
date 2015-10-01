require 'rails_helper'

RSpec.describe "releases/index", type: :view do
  before(:each) do
    assign(:releases, [
      Release.create!(),
      Release.create!()
    ])
  end

  it "renders a list of releases" do
    render
  end
end
