require 'rails_helper'

RSpec.describe "albumformats/show", type: :view do
  before(:each) do
    @albumformat = assign(:albumformat, Albumformat.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
