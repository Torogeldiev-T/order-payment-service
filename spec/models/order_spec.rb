require 'rails_helper'

RSpec.describe Order, type: :model do
  subject { create(:order) }
  it "is valid" do
    expect(subject).to be_valid
  end

  it "is not valid without email" do
    subject.update(client_email: nil)
    expect(subject).not_to be_valid
  end

  it "is not valid with incorrect email format" do
    subject.update(client_email: 'incorrect')
    expect(subject).not_to be_valid
  end
end
