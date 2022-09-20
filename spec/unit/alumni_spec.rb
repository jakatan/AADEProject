require 'rails_helper'

RSpec.describe Alumni, type: :model do
  subject do
    describe_class.new(graduation_year: '2022', companies_worked: 'TAMU', companyID: 420)
  end

  it 'is valid with valid atributes' do
    expect(subject).to be_vaild
  end
  
end
