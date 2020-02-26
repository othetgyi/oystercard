
class Oystercard
  MAX_BALANCE = 90
  MIN_BALANCE = 1

  attr_accessor :balance

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(money)
    fail "Maximum balance is £90" if money + balance > MAX_BALANCE
    @balance += money
  end




  def touch_in
    fail "Insufficient balance to touch in" if balance < MIN_BALANCE
    @in_journey = true
  end

  def touch_out
    @balance -= 4
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

private
  def deduct(money)
    @balance -= money
  end

end
