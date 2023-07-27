require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order) { create(:order) }
  subject { create(:order_line, order: order) }

  it "is valid" do
    expect(subject).to be_valid
  end

  it "is not valid without order_id" do
    subject.update(order_id: nil)
    expect(subject).not_to be_valid
  end
end
