require 'account'

describe Account do
  let(:account) { described_class.new }

  describe 'An account instance' do
    it 'has a history and balance' do
      expect(account.balance).to eq 0
      expect(account.history.length).to eq 0
    end
  end

  describe '#deposit' do
    it 'allows user to deposit money into their accound' do
      account.deposit(5)
      expect(account.balance).to eq 5
    end

    it 'does nothing if an integer is not provided' do
      account.deposit("Hello")
      expect(account.balance).to eq 0
    end
  end

  describe '#withdraw' do
    before(:each) do
      account.deposit(20)
    end

    it 'allows user to withdraw their money' do
      account.withdraw(5)
      expect(account.balance).to eq 15
    end

    it 'does nothing if given amount is not an integer' do
      account.withdraw({})
      expect(account.balance).to eq 20
    end

    it 'gives the user a message if insuffient funds' do
      expect(account.withdraw(25)).to eq "Insuffient funds"
    end

  end
end
