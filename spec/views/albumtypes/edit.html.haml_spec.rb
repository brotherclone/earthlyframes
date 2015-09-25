require 'rails_helper'

RSpec.describe "albumtypes/edit", type: :view do
  before(:each) do
    @albumtype = assign(:albumtype, Albumtype.create!())
  end

  it "renders the edit albumtype form" do
    render

    assert_select "form[action=?][method=?]", albumtype_path(@albumtype), "post" do
    end
  end
end
