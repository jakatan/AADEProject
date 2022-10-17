# frozen_string_literal: true

require 'rails_helper'

RSpec.describe(Company, type: :model) do
     subject do
          described_class.new(name: 'TAMU', website: 'www.website.com')
     end

     it 'is valid with valid attributes' do
          expect(subject).to(be_valid)
     end

     it 'is not valid without company name' do
          subject.name = nil
          expect(subject).not_to(be_valid)
     end

     it 'is not valid without company website' do
          subject.website = nil
          expect(subject).not_to(be_valid)
     end
end
