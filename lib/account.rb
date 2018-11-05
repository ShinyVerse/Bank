# Allows users to hold accounts
class Account
  attr_reader :balance, :history
  def initialize
    @balance = 0
    @history = []
  end

  def deposit amount
    top_up(amount)
  end


  private

  def top_up amount
    @balance += amount
  end
end
