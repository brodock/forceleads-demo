class Lead
  include ActiveModel::Model

  attr_accessor :first_name, :last_name, :email, :company, :title, :phone, :website

  validates :last_name, presence: true
  validates :company, presence: true

  # @return [Hash] model attributes like a real activemodel
  def attributes
    {first_name: first_name, last_name: last_name, email: email, company: company, title: title, phone: phone, website: website}
  end

  # @return [Hash] model attributes suitable for use with the ForceLeads gem
  def remote_attributes
    Hash[attributes.map {|k,v| [k.to_s.camelize.to_sym, v]}]
  end
end