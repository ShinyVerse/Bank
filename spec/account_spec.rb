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
      expect(account.deposit(0)).to eq "Insuffient funds"
      expect(account.deposit(-5)).to eq "Insuffient funds"
      expect(account.deposit({})).to eq "Insuffient funds"
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

    it 'gives the user a message if insuffient funds' do
      expect(account.withdraw(25)).to eq 'Insuffient funds'
    end

    it 'gives message insuffient funds if entered in 0, negative or non-Int' do
      expect(account.withdraw(0)).to eq "Insuffient funds"
      expect(account.withdraw(-5)).to eq "Insuffient funds"
      expect(account.withdraw({})).to eq "Insuffient funds"
      expect(account.balance).to eq 20
    end
  end

  describe '#print_statement' do
    before(:each) do
      account.deposit(20)
    end

    it 'prints out a pretty statement for the user' do
      expect(account.print_statement).to eq true
      # expect { account.print_statement([log1]) }.to
    end
  end
end
