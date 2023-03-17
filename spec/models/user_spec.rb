# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(fname: 'test', lname: 'testing',
             contact_number: '1234567890', email: 'test@sample.com', password: 123_456)
  end
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is valid with valid attributes' do
    subject.fname = 'test'
    expect(subject).to be_valid
  end

  it 'is valid with valid attributes' do
    subject.lname = 'testing'
    expect(subject).to be_valid
  end

  it 'is valid with valid attributes' do
    subject.contact_number = 1_234_567_890
    expect(subject).to be_valid
  end

  it 'is valid with valid attributes' do
    subject.email = 'test@gmail.com'
    expect(subject).to be_valid
  end

  it 'is valid with valid attributes' do
    subject.password = 123_456
    expect(subject).to be_valid
  end

  describe 'Association' do
    it { should have_many(:quantities) }
    it { should have_many(:currencies).through(:quantities) }
  end
end
