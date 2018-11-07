require_relative 'statement'
require_relative 'printer'

# Allow a user to have an account
class Account
  attr_reader :balance
  def initialize(statement = Statement.new, printer = Printer.new)
    @balance = 0
    @acc_statement = statement
    @printer = printer
  end

  def deposit(amount, date = Time.now.strftime('%d/%m/%Y'))
    date = validate_date(date)
    if !date
      puts 'Please enter a valid date as a string'
    elsif illegal_entry? amount
      puts 'Unexpected entry'
    else
      @balance += amount
      log_transaction(amount, 'deposit', date)
      puts "Deposited: £#{format("%.2f", amount)}"
    end
  end

  def withdraw(amount, date = Time.now.strftime('%d/%m/%Y'))
    date = validate_date(date)
    if illegal_entry? amount
      puts 'Unexpected entry'
    elsif  balance < amount
      puts 'Insuffient funds'
    elsif (balance - amount) >= 0
      @balance -= amount
      log_transaction(amount, 'withdraw', date)
      puts "Withdrew: £#{format("%.2f", amount)}"
    end
  end

  def statement
    @printer.print(@acc_statement.history)
    return true
  end

  private

  def log_transaction(amount, type, date)
    if type == 'deposit'
      @acc_statement.deposit(amount, @balance, date)
    elsif type == 'withdraw'
      @acc_statement.withdraw(amount, @balance, date)
    end
  end

  def illegal_entry?(amount)
    !amount.is_a?(Integer) && !amount.is_a?(Float) || amount <= 0
  end

  def validate_date date
    if /\d{2}\/\d{2}\/\d{2}/ =~ date
      return date
    elsif /\d{2}-\d{2}-\d{2}/ =~ date
      return date.tr("-", '/')
    end

    false
  end
end
