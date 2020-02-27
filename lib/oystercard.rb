require_relative 'station'

class Oystercard
  MAX_BALANCE = 90
  MIN_BALANCE = 1

  attr_accessor :balance
  attr_accessor :entry_station
  attr_accessor :exit_station
  attr_accessor :journey_tracker
  attr_accessor :journey_complete

  def initialize
    @balance = 0
    @in_journey = false
    @journey_tracker = []
    @journey_complete = false

  end

  def top_up(money)
    fail "Maximum balance is £90" if money + balance > MAX_BALANCE
    @balance += money
  end

  def touch_in(station)
    fail "Insufficient balance to touch in" if balance < MIN_BALANCE
    @in_journey = true
    @entry_station = station
    @journey_complete = false
  end

  def touch_out(station)
    @balance -= 4
    @in_journey = false
    @exit_station = station
    @journey_tracker << { :entry_station => @entry_station, :exit_station => @exit_station }
    @journey_complete = true
  end

  def in_journey?
    @in_journey
  end



private
  def deduct(money)
    @balance -= money
  end

end
