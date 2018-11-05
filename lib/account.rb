# Allows users to hold accounts
class Account
  attr_reader :balance, :history
  def initialize(statement = Statement.new)
    @balance = 0
    @history = statement.history
  end

  def deposit(amount)
    top_up(amount) if amount.is_a? Integer
    log_transaction(amount, 'deposit')
  end

  def withdraw(amount)
    return unless amount.is_a? Integer

    if (balance - amount) >= 0
      remove_amount(amount)
      log_transaction(amount, 'withdraw')
    else
      'Insuffient funds'
    end
  end

  private

  def remove_amount(amount)
    @balance -= amount
  end

  def top_up(amount)
    @balance += amount
  end

  def log_transaction(amount, type, time = Time.now)
    transaction_date = time.strftime('%d/%m/%Y')
    if type == 'deposit'
      @history.push(
        date: transaction_date,
        credit: amount,
        debit: ''
      )
    else
      @history.push(
        date: transaction_date,
        credit: '',
        debit: amount
      )
    end
  end
end
