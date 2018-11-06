# Holds a log of customers transactions
class Statement
  attr_reader :history
  def initialize
    @history = []
  end

  def deposit(amount, current_balance, transaction_date)
    @history.unshift(
      date: transaction_date,
      credit: amount,
      debit: '',
      balance: current_balance
    )
  end

  def withdraw(amount, current_balance, transaction_date)
    @history.unshift(
      date: transaction_date,
      credit: '',
      debit: amount,
      balance: current_balance
    )
  end
end
