require 'rails_helper'

RSpec.describe Show, type: :model do
  it 'has a vaild Factory' do
    expect(build(:show)).to be_valid
  end
end
