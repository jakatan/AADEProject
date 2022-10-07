require 'rails_helper'

RSpec.describe Alumni, type: :model do
  person = Person.create(name: 'test', class_year: '2023', membership_length: '20 years')
  subject do
    described_class.new(graduation_year: '2022', companies_worked: 'TAMU', person_id: person.id)
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

  it 'is deleted when person is deleted' do
    person.destroy
    expect(Person.exists?(person.id)).to be false
    expect(Officer.exists?(subject.id)).to be false
  end
end
