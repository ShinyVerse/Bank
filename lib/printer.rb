# Prints out any messages for the user
class Printer
  def print(statement_log)
    puts 'date  || credit || debit || balance '
    statement_log.each do |entry|
      date = entry[:date]
      credit = empty_str?(entry[:credit]) ? ' ' : entry[:credit]
      debit = empty_str?(entry[:debit]) ? ' ' : entry[:debit]
      balance = entry[:balance]
      puts "#{date} || #{credit} || #{debit} || #{balance}".center(30)
    end
  end

  def action_message(amount, msg)
    money = format("%.2f", amount)
    puts msg === "deposit" ? "Deposited: £#{money}" : "Withdraw: £#{money}"
  end

  private

  def empty_str?(entry)
    entry == ''.empty?
  end
end
