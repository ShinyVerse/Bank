require 'account'
require 'statement'
require 'printer'

describe Account do
  let(:account) { described_class.new }

  describe 'User can' do
    
    it 'can deposit cash into their account' do
      expect { account.deposit(5.50) }.to change { account.balance }.by(5.5)
      expect { account.deposit(5.50) }.to output("Deposited: £5.50\n").to_stdout
    end

    it "can withdraw money from an account with a balance" do
      account.deposit(15)
      expect { account.withdraw(5) }.to change { account.balance }.by(-5)
      expect { account.withdraw(5) }.to output("Withdrew: £5.00\n").to_stdout
    end

    it "returns 'Insuffient funds' if user enters invalid or illegal amount" do
      expect { account.deposit("WRONG") }.to output("Unexpected entry\n").to_stdout
      expect { account.withdraw("WRONG") }.to output("Unexpected entry\n").to_stdout
      expect { account.deposit(0) }.to output("Unexpected entry\n").to_stdout
      expect { account.deposit(-50) }.to output("Unexpected entry\n").to_stdout
    end

    it "returns 'Insuffient funds' if not enough funds in account" do
      expect { account.withdraw(50) }.to output("Insuffient funds\n").to_stdout
    end

    it 'returns a statement if user asks for it' do
      account.deposit(30, "12/04/12")
      expect { account.statement }.to output("date  || credit || debit || balance \n12/04/12 || 30.00 ||  || 30.00\n").to_stdout
    end

    it "returns 'Wrong date format' if validation fails" do
      expect { account.deposit(30, "error") }.to output("Please enter a valid date as a string\n").to_stdout
    end

    it "allows entry of a date in the format: '12-12-12'" do
      expect { account.deposit(30, "12-12-12") }.to output("Deposited: £30.00\n").to_stdout
    end
  end
end
