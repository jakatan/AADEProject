require 'rails_helper'

RSpec.describe Position, type: :model do
  subject do
    company = Company.create(companyName: 'TAMU', company_website: 'www.tamu.edu')
    person = Person.create(name: 'test', class_year: '2023', membership_length: '20 years')
    described_class.new(position: 'leader', person_id: person.id , company_id: company.id)

  end
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without position' do
    subject.position = nil
    expect(subject).not_to be_valid
  end

  it 'it not valid without company_id' do
    subject.company_id = nil
    expect(subject).not_to be_valid
  end

  it 'it not valid without person_id' do
    subject.person_id = nil
    expect(subject).not_to be_valid
  end
end
