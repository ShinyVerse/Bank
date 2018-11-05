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
    credit: "",
    debit: 50,
    balance: 950
  }
  historyLog = [entry1]
  twoEntriesLog = [entry1, entry2]

  let(:printer) { described_class.new }
  describe '#print' do
    it 'displays information nicely for the user (one entry)' do
      expect { printer.print(historyLog) }.to output("  date  || credit ||"\
                                                     " debit || balance"\
                                                     " \n12/04/12||30||"\
                                                     "  ||1000\n").to_stdout
    end

    it 'displays two entries' do
      expect { printer.print(twoEntriesLog) }.to output("  date  || credit ||"\
                                                     " debit || balance"\
                                                     " \n12/04/12||30||"\
                                                     "  ||1000\n"\
                                                     "10/04/12||  ||"\
                                                     "50||950\n").to_stdout
    end
  end
end