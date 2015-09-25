require 'rails_helper'

RSpec.describe "albumformats/index", type: :view do
  before(:each) do
    assign(:albumformats, [
      Albumformat.create!(),
      Albumformat.create!()
    ])
  end

  it "renders a list of albumformats" do
    render
  end
end
