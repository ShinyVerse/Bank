require 'account'

describe Account do
  log1 = {
    date: '12/04/12',
    credit: 30,
    debit: '',
    balance: 1000
  }
  let(:statement) do
    double('statement', deposit: true, withdraw: true,
                        history: [log1])
  end
  let(:printer) do
    double('printer', print: true, action_message: true)
  end
  let(:account) { described_class.new(statement, printer) }

  describe '#deposit' do
    it 'allows user to deposit money into their account' do
      expect { account.deposit(5) }.to change { account.balance }.by(5)
    end

    it 'raises error if invalid date given' do
      msg = 'Please enter a valid date as a string'
      expect { account.deposit(50, "wrong") }.to raise_error(msg)
    end

    it 'gives message of insuffient funds if user enters negative, 0 or non-Int' do
      expect { account.deposit(0) }.to raise_error("Unexpected entry")
      expect { account.deposit(-5) }.to raise_error("Unexpected entry")
      expect { account.deposit({}) }.to raise_error("Unexpected entry")
    end

    it 'allows float numbers' do
      expect { account.deposit(5.50) }.to change { account.balance }.by(5.5)
    end
  end

  describe '#withdraw' do
    before(:each) do
      account.deposit(20)
    end

    it 'allows user to withdraw their money' do
      expect { account.withdraw(5) }.to change { account.balance }.by(-5)
    end

    it 'allows float numbers' do
      expect { account.withdraw(4.5) }.to change { account.balance }.by(-4.5)
    end

    it 'gives the user a message if not enough in account' do
      expect { account.withdraw(25) }.to raise_error("Insuffient funds")
    end

    it 'gives message insuffient funds if entered in 0, negative or non-Int' do
      expect { account.withdraw(0) }.to raise_error("Unexpected entry")
      expect { account.withdraw(-5) }.to raise_error("Unexpected entry")
      expect { account.withdraw({}) }.to raise_error("Unexpected entry")
    end
  end

  describe '#statement' do
    before(:each) do
      account.deposit(20)
    end

    it 'prints out a pretty statement for the user' do
      expect(account.statement).to eq true
    end
  end
end
