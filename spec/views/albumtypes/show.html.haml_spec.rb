require 'rails_helper'

RSpec.describe "albumtypes/show", type: :view do
  before(:each) do
    @albumtype = assign(:albumtype, Albumtype.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
