# Allows users to hold accounts
class Account
  attr_reader :balance, :statement
  def initialize(statement = Statement.new)
    @balance = 0
    @statement = statement
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
    date = time.strftime('%d/%m/%Y')
    if type == 'deposit'
      @statement.deposit(amount, @balance, date )
    elsif type == 'withdraw'
      @statement.withdraw(amount, @balance, date )
    end
  end
end
