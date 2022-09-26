require 'rails_helper'

RSpec.describe Alumni, type: :model do
  subject do
    described_class.new(graduation_year: '2022', companies_worked: 'TAMU', person_id: 420)
  end

  it 'is valid with valid atributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without graduation year' do
    subject.graduation_year = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without companies_worked' do
    subject.companies_worked = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without person id' do
    subject.person_id = nil
    expect(subject).not_to be_valid
  end
end