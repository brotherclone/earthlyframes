require 'rails_helper'

RSpec.describe Release, type: :model do
  it 'has a vaild Factory' do
    expect(build(:release)).to be_valid
  end
end
