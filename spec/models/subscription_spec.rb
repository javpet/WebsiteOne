require 'spec_helper'

shared_examples 'a subscription' do
  it { should belong_to :user }

  it {should have_one :payment_source}

  it 'has the correct type' do
    expect(subject.type).to eq type
  end

  it {should validate_presence_of :started_at}

  it 'has ended_at' do
    expect(subject.ended_at).to be_nil
  end
end

describe Subscription, type: :model do
  let(:type) { nil }
  it_behaves_like 'a subscription'
end

describe Premium, type: :model do
  let(:type) { 'Premium' }
  it_behaves_like 'a subscription'
end

describe PremiumPlus, type: :model do
  let(:type) { 'PremiumPlus' }
  it_behaves_like 'a subscription'
end