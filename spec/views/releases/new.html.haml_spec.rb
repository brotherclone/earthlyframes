require 'rails_helper'

RSpec.describe "releases/new", type: :view do
  before(:each) do
    assign(:release, Release.new())
  end

  it "renders new release form" do
    render

    assert_select "form[action=?][method=?]", releases_path, "post" do
    end
  end
end
