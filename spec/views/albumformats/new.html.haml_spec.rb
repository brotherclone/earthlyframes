require 'rails_helper'

RSpec.describe "albumformats/new", type: :view do
  before(:each) do
    assign(:albumformat, Albumformat.new())
  end

  it "renders new albumformat form" do
    render

    assert_select "form[action=?][method=?]", albumformats_path, "post" do
    end
  end
end
