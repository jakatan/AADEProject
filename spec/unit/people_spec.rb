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
    subject.name = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without class year' do
    subject.class_year = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without membership length' do
    subject.membership_length = nil
    expect(subject).not_to be_valid
  end

  it 'deletes dependent officer when deleted' do
    officer = Officer.create(person_id: subject.id, position: 'test', year_elected: '2022', description: 'test')

    subject.destroy
    expect(Person.exists?(subject.id)).to be false
    expect(Officer.exists?(officer.id)).to be false
  end

  it 'deletes dependent alumni when deleted' do
    alumni = Alumni.create(person_id: subject.id, graduation_year: 'test', companies_worked: 'test')

    subject.destroy
    expect(Person.exists?(subject.id)).to be false
    expect(Alumni.exists?(alumni.id)).to be false
  end

  it 'deletes dependent positions when deleted' do
    company = Company.create(website: 'test', name: 'test')
    position = Position.create(person_id: subject.id, company_id: company.id, position: 'test')

    subject.destroy
    expect(Person.exists?(subject.id)).to be false
    expect(Position.exists?(position.id)).to be false
    expect(Company.exists?(company.id)).to be true
  end
end