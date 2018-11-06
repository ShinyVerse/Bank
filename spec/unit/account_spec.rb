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
    double('printer', print: true)
  end
  let(:account) { described_class.new(statement, printer) }

  describe 'An account instance' do
    it 'has a balance' do
      expect(account.balance).to eq 0
    end
  end

  describe '#deposit' do
    it 'allows user to deposit money into their account' do
      account.deposit(5)
      expect(account.balance).to eq 5
    end

    it 'gives message of insuffient funds if user enters negative, 0 or non-Int' do
      expect { account.deposit(0) }.to output("Unexpected entry\n").to_stdout
      expect { account.deposit(-5) }.to output("Unexpected entry\n").to_stdout
      expect { account.deposit({}) }.to output("Unexpected entry\n").to_stdout
      expect(account.balance).to eq 0
    end

    it 'allows float numbers' do
      account.deposit(5.50)
      expect(account.balance).to eq 5.50
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
    it 'allows float numbers' do
      account.withdraw(4.50)
      expect(account.balance).to eq 15.50
    end

    it 'gives the user a message if not enough in account' do
      expect { account.withdraw(25) }.to output("Insuffient funds\n").to_stdout
    end

    it 'gives message insuffient funds if entered in 0, negative or non-Int' do
      expect { account.withdraw(0) }.to output("Unexpected entry\n").to_stdout
      expect { account.withdraw(-5) }.to output("Unexpected entry\n").to_stdout
      expect { account.withdraw({}) }.to output("Unexpected entry\n").to_stdout
      expect(account.balance).to eq 20
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
