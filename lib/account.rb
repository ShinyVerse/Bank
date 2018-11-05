# Allows users to hold accounts
class Account
  attr_reader :balance, :history
  def initialize
    @balance = 0
    @history = []
  end

  def deposit amount
    top_up(amount) if amount.is_a? Integer
  end

  def withdraw amount
    return unless amount.is_a? Integer
    if (balance - amount) >= 0
      remove_amount(amount)
    else
      "Insuffient funds"
    end
  end

  private

  def remove_amount amount
    @balance -= amount
  end

  def top_up amount
    @balance += amount
  end
end
