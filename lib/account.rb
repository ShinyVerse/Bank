# Allows users to hold accounts
class Account
  attr_reader :balance, :acc_statement
  def initialize(statement = Statement.new)
    @balance = 0
    @acc_statement = statement
  end

  def deposit(amount, date = Time.now.strftime('%d/%m/%Y') )
    top_up(amount) if amount.is_a? Integer
    log_transaction(amount, 'deposit', date)
  end

  def withdraw(amount, date = Time.now.strftime('%d/%m/%Y'))
    return unless amount.is_a? Integer

    if (balance - amount) >= 0
      remove_amount(amount)
      log_transaction(amount, 'withdraw', date)
    else
      'Insuffient funds'
    end
  end

  def print
     acc_statement.history.each do |entry|
       puts "Date: #{entry[:date]}"
       puts "Credit: #{entry[:credit]}"
       puts "Debit: #{entry[:debit]}"
       puts "Balance: #{entry[:balance]}"

     end
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
