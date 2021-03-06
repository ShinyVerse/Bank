require 'statement'

describe Statement do
  entrywithdraw = { date: '12/04/12', credit: '', debit: '30.00', balance: '1000.00' }
  entrydeposit = { date: '12/04/12', credit: '30.00', debit: '', balance: '1000.00' }
  let(:statement) { described_class.new }

  describe 'Statements appear in descending order' do
    before(:each) do
      statement.deposit(30, 1030, '12/04/12')
      statement.deposit(30.00, 1060.00, '14/04/12')
    end
    it 'by adding the newest statement into first position' do
      expect(statement.history).to eq([{ date: '14/04/12',
                                         credit: '30.00',
                                         debit: '',
                                         balance: '1060.00' },
                                       { date: '12/04/12',
                                         credit: '30.00',
                                         debit: '',
                                         balance: '1030.00' }])
    end
  end

  describe '#deposit' do
    it 'expects to log a deposit' do
      statement.deposit(30, 1000, '12/04/12')
      expect(statement.history).to include entrydeposit
    end
  end

  describe '#withdraw' do
    it 'expects to log a withdrawal' do
      statement.withdraw(30, 1000, '12/04/12')
      expect(statement.history).to include entrywithdraw
    end
  end
end
