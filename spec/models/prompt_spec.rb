require 'rails_helper'

RSpec.describe Prompt, type: :model do

  it 'has a valid Factory' do
    expect(build(:prompt)).to be_valid
  end

end
