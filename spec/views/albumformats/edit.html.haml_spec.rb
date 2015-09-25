require 'rails_helper'

RSpec.describe "albumformats/edit", type: :view do
  before(:each) do
    @albumformat = assign(:albumformat, Albumformat.create!())
  end

  it "renders the edit albumformat form" do
    render

    assert_select "form[action=?][method=?]", albumformat_path(@albumformat), "post" do
    end
  end
end
