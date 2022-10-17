require 'rails_helper'

RSpec.describe Company, type: :model do
  subject do
    described_class.new( companyName: 'TAMU', company_website: 'www.website.com')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without company name' do
    subject.companyName = nil;
    expect(subject).not_to be_valid
  end

  it 'is not valid without company website' do
    subject.company_website = nil;
    expect(subject).not_to be_valid
  end
end
