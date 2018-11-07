require 'spec_helper'
require 'account'
require 'statement'
require 'printer'

describe 'Account API' do
  let(:account) { Account.new }
  it 'user can deposit, withdraw and get a statement' do
    date = Time.now.strftime("%d/%m/%Y")
    expect { account.deposit(5.50) }.to change { account.balance }.by(5.5)
    expect { account.withdraw(3.50) }.to change { account.balance }.by(-3.5)
    expect { account.statement }.to output("date  || credit || debit || balance \n"\
                                           "#{date} ||  || 3.50 || 2.00\n"\
                                           "#{date} || 5.50 ||  || 5.50\n").to_stdout
  end
end
