# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe Person, type: :model do
  subject do
    described_class.new(name: 'david', class_year: '2023', membership_length: '6 years')
  end
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without name' do
    subject.name = nil;
    expect(subject).not_to be_valid
  end

  it 'is not valid without class year' do
    subject.class_year = nil;
    expect(subject).not_to be_valid
  end

  it 'is not valid without membership length' do
    subject.membership_length = nil;
    expect(subject).not_to be_valid
  end

end