
class Oystercard
  MAX_BALANCE = 90

  attr_accessor :balance

  def initialize
    @balance = 0
    @status = false
  end

  def top_up(money)
    fail "Maximum balance is £90" if money + balance > MAX_BALANCE
    @balance += money
  end

  def deduct(money)
    @balance -= money
  end

  def touch_in
    @status = true
  end

  def touch_out
    @status = false
  end

  def in_journey?
    @status
  end
end
