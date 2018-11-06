# Holds a log of customers transactions
class Statement
  attr_reader :history
  def initialize
    @history = []
  end

  def deposit(amount, current_balance, transaction_date)
    @history.unshift(
      date: transaction_date,
      credit: format('%.2f', amount),
      debit: '',
      balance: format('%.2f', current_balance)
    )
  end

  def withdraw(amount, current_balance, transaction_date)
    @history.unshift(
      date: transaction_date,
      credit: '',
      debit: format('%.2f', amount),
      balance: format('%.2f', current_balance)
    )
  end
end
