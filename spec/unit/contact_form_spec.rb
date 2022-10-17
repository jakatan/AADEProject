# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(ContactForm, type: :model) do
     subject do
          described_class.new(person_id: 12, email: 'test', name: 'test', message: 'test')
     end

     it 'is valid with valid atributes' do
          expect(subject).to(be_valid)
     end

     it 'is not valid without person id' do
          subject.person_id = nil
          expect(subject).not_to(be_valid)
     end

     it 'is not valid without email' do
          subject.email = nil
          expect(subject).not_to(be_valid)
     end

     it 'is not valid without name' do
          subject.name = nil
          expect(subject).not_to(be_valid)
     end

     it 'is not valid without message' do
          subject.message = nil
          expect(subject).not_to(be_valid)
     end
end
