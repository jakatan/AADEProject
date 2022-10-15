# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(Officer, type: :model) do
     subject do
          described_class.new(person_id: @person.id, position: 'lead', email: 'test', year_elected: 'test',
                              description: 'test'
          )
     end

     before :all do
          @person = Person.create!(name: 'test', class_year: '2023', membership_length: '20 years')
     end

     after :all do
          @person.destroy!
     end

     it 'is valid with valid atributes' do
          expect(subject).to(be_valid)
     end

     it 'is not valid without position' do
          subject.position = nil
          expect(subject).not_to(be_valid)
     end

     it 'is not valid without email' do
          subject.email = nil
          expect(subject).not_to(be_valid)
     end

     it 'is not valid without year_elected' do
          subject.year_elected = nil
          expect(subject).not_to(be_valid)
     end

     it 'is not valid without description' do
          subject.description = nil
          expect(subject).not_to(be_valid)
     end

     it 'is not valid without person' do
          subject.person_id = nil
          expect(subject).not_to(be_valid)
     end
end
