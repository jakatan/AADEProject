require 'rails_helper'

RSpec.describe Position, type: :model do
  subject do
    described_class.new(position: 'leader', companyID: 69420)
  end
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without position' do
    expect(subject).not_to be_valid
  end

  it 'it not valid without companyID' do
    expect(subject).not_to be_vaild
  end
end
