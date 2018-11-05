require 'statement'

describe Statement do
  let(:statement) { described_class.new}

  describe 'Statement initalization' do
    it 'starts with a blank history' do
      expect(statement.history.length).to eq 0
    end
  end

  describe '#deposit' do
    it 'expects to log a deposit' do
      statement.deposit(30, 1030, "12/04/12")
      expect(statement.history).to include (
        { date: "12/04/12",
          credit: 30,
          debit: "",
          balance: 1030 }
      )
    end
  end

  describe '#withdraw' do
    it 'expects to log a withdrawal' do
      statement.withdraw(30, 1000, "12/04/12")
      expect(statement.history).to include (
        { date: "12/04/12",
          credit: "",
          debit: 30,
          balance: 1000 }
      )
    end
  end
end
