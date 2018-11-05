# Prints out messages nicely for the user
class Printer
  def print(statement_log)
    puts '  date  || credit || debit || balance '
    statement_log.each do |entry|
      date = entry[:date]
      credit = isEmptyStr?(entry[:credit]) ? '  ' : entry[:credit]
      debit = isEmptyStr?(entry[:debit]) ? '  ' : entry[:debit]
      balance = entry[:balance]
      puts "#{date}||#{credit}||#{debit}||#{balance}"
    end
  end

private
  def isEmptyStr?(entry)
    entry == ''
  end
end
