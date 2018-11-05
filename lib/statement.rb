# Holds a log of customers transactions
class Statement
  attr_reader :history
  def initialize
    @history = []
  end
end
