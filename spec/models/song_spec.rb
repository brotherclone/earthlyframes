require 'rails_helper'

RSpec.describe Song, type: :model do
  it 'has a vaild Factory' do
    expect(build(:song)).to be_valid
  end
end
