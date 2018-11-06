# Prints out messages nicely for the user
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

  private

  def empty_str?(entry)
    entry == ''.empty?
  end
end
