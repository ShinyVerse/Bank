require 'spec_helper'
require 'account'
require 'statement'
require 'printer'

describe 'Account API' do
  let(:account) { Account.new }
  it 'user can deposit, withdraw and get a statement' do
    account.deposit(1000, "10-01-2012")
    account.deposit(2000, "13-01-2012")
    account.withdraw(500, "14-01-2012")
    expect { account.statement }.to output("date  || credit || debit || balance \n"\
                                           "14/01/2012 ||  || 500.00 || 2500.00\n"\
                                           "13/01/2012 || 2000.00 ||  || 3000.00\n"\
                                           "10/01/2012 || 1000.00 ||  || 1000.00\n").to_stdout
  end
end
