require 'rails_helper'

RSpec.describe Alumni, type: :model do

  before :all do
    @person = Person.create(name: 'test', class_year: '2001', membership_length: '20 years')
  end

  subject do
    described_class.new(graduation_year: '2022', companies_worked: 'TAMU', person_id: @person.id)
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


  after :all do
    @person.destroy
  end
end
