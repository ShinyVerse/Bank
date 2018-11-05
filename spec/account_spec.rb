require 'account'

describe Account do
  let(:account) { described_class.new }

  describe 'An account instance' do
    it 'has a history and balance' do
      expect(account.balance).to eq 0
      expect(account.history.length).to eq 0
    end
  end
end
