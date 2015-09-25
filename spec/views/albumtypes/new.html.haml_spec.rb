require 'rails_helper'

RSpec.describe "albumtypes/new", type: :view do
  before(:each) do
    assign(:albumtype, Albumtype.new())
  end

  it "renders new albumtype form" do
    render

    assert_select "form[action=?][method=?]", albumtypes_path, "post" do
    end
  end
end
