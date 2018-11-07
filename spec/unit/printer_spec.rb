require 'printer'

describe Printer do
  entry1 = {
    date: '12/04/12',
    credit: 30,
    debit: '',
    balance: 1000
  }
  entry2 = {
    date: '10/04/12',
    credit: '',
    debit: 50,
    balance: 950
  }
  two_entries_log = [entry1, entry2]

  let(:printer) { described_class.new }
  describe '#print' do
    it 'displays information nicely for the user (one entry)' do
      expect { printer.print([entry1]) }.to output("date  || credit || debit || balance \n  12/04/12 || 30 ||  || 1000  \n").to_stdout
    end

    it 'displays two entries' do
      expect { printer.print(two_entries_log) }.to output("date  || credit || debit || balance \n  12/04/12 || 30 ||  || 1000  \n  10/04/12 ||  || 50 || 950   \n").to_stdout
    end
  end

  describe '#action_message' do
    it 'returns deposit message' do
      expect { printer.action_message(50, "deposit") }.to output("Deposited: £50.00\n").to_stdout
    end

    it 'returns a withdraw message' do
      expect { printer.action_message(50, "withdraw") }.to output("Withdraw: £50.00\n").to_stdout
    end
  end
end
