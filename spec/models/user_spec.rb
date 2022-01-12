require 'rails_helper'

RSpec.describe User, type: :model do
  it 'creates correct record about admin' do
    admin = described_class.create(name: 'admin', password: '21232f297a57a5a743894a0e4a801fc3')
    expect(admin).to be_valid
  end

  it 'creates incorrect record about admin with non-md5 password' do
    weak_admin = described_class.create(name: 'weak_admin', password: 'too_weak_password..')
    expect(weak_admin).not_to be_valid
  end
end
