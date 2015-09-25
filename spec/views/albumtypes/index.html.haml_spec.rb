require 'rails_helper'

RSpec.describe "albumtypes/index", type: :view do
  before(:each) do
    assign(:albumtypes, [
      Albumtype.create!(),
      Albumtype.create!()
    ])
  end

  it "renders a list of albumtypes" do
    render
  end
end
