require 'spec_helper'

describe Lead do
  it { should respond_to :first_name, :last_name, :email, :company, :title, :phone, :website }

  context 'validations' do
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :company }
  end

  let(:lead) { FactoryGirl.build(:lead) }

  context '#attributes' do
    it 'returns a hash' do
      expect(lead.attributes).to be_a_kind_of Hash
    end

    it 'the hash contains all attributes' do
      expect(lead.attributes).to include(:first_name)
      expect(lead.attributes).to include(:last_name)
      expect(lead.attributes).to include(:email)
      expect(lead.attributes).to include(:company)
      expect(lead.attributes).to include(:title)
      expect(lead.attributes).to include(:phone)
      expect(lead.attributes).to include(:website)
    end
  end

  context '#remote_attributes' do
    it 'returns a hash' do
      expect(lead.remote_attributes).to be_a_kind_of Hash
    end

    it 'the hash contains all attributes in camelcase' do
      expect(lead.remote_attributes).to include(:FirstName)
      expect(lead.remote_attributes).to include(:LastName)
      expect(lead.remote_attributes).to include(:Email)
      expect(lead.remote_attributes).to include(:Company)
      expect(lead.remote_attributes).to include(:Title)
      expect(lead.remote_attributes).to include(:Phone)
      expect(lead.remote_attributes).to include(:Website)
    end
  end
end
