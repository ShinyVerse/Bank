# Allows users to hold accounts
class Account
  attr_reader :balance, :acc_statement, :printer
  def initialize(statement = Statement.new, printer = Printer.new)
    @balance = 0
    @acc_statement = statement
    @printer = printer
  end

  def deposit(amount, date = Time.now.strftime('%d/%m/%Y'))
    if ( !amount.is_a?(Integer) && !amount.is_a?(Float) || amount <= 0 )
      return 'Insuffient funds'
    else
    top_up(amount)
    log_transaction(amount, 'deposit', date)
  end
  end

  def withdraw(amount, date = Time.now.strftime('%d/%m/%Y'))
    if ( !amount.is_a?(Integer) || amount <= 0 || balance < amount )
      return 'Insuffient funds'
    elsif (balance - amount) >= 0
      remove_amount(amount)
      log_transaction(amount, 'withdraw', date)
    end
  end

  def print_statement
    printer.print(acc_statement.history)
  end

  private

  attr_reader :acc_statement

  def remove_amount(amount)
    @balance -= amount
  end

  def top_up(amount)
    @balance += amount
  end

  def log_transaction(amount, type, date)
    if type == 'deposit'
      @acc_statement.deposit(amount, @balance, date)
    elsif type == 'withdraw'
      @acc_statement.withdraw(amount, @balance, date)
    end
  end
end
