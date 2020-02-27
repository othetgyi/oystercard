require 'oystercard'
require 'station'

describe Oystercard do

  it "creates a card with an empty list of journeys" do
    card = Oystercard.new
    expect(card.journey_tracker).to eq []
  end

  it 'creates a card with a balance of 0' do
    card = Oystercard.new
    expect(card.balance).to eq(0)
  end

  it 'adds money to the balance when topped-up' do
    card = Oystercard.new
    expect(card.top_up(10)).to eq(10)
  end

  it 'raises an error if balance exceeds £90' do
    card = Oystercard.new
    card.balance = 90
    expect { card.top_up(0.01) }.to raise_error 'Maximum balance is £90'
  end

  it 'is initially not in a journey' do
    card = Oystercard.new
    expect(card).not_to be_in_journey
  end

  it 'checks that your journey is complete' do
    card = Oystercard.new
    card.top_up(10)
    card.touch_in("New Cross Gate")
    card.touch_out("London Bridge")
    expect(card.journey_complete).to be true
  end

  describe "#touch_in" do
    it 'will not touch in if below minimum balance' do
      card = Oystercard.new
      expect{ card.touch_in("Farringdon") }.to raise_error 'Insufficient balance to touch in'
    end

    it "can touch in" do
      card = Oystercard.new
      expect(card).to respond_to(:touch_in)
    end

    it "stores the entry station" do
      card = Oystercard.new
      card.top_up(10)
      card.touch_in("Farringdon")
      expect(card.entry_station).to eq "Farringdon"
    end

    it 'will not be a complete journey if you have only touched in' do
      card = Oystercard.new
      card.top_up(10)
      card.touch_in("New Cross")
      expect(card.journey_complete).to be false
    end
end

  describe "#touch_out" do
    it "can touch out" do
      card = Oystercard.new
      #card.touch_out("nil")
      expect(card).not_to be_in_journey
    end

    it "stores the exit station" do
      card = Oystercard.new
      card.top_up(10)
      card.touch_in("Queens Road Peckham")
      card.touch_out("London Bridge")
      expect(card.exit_station).to eq "London Bridge"
    end

    it "substracts £4 from the balance when you touch out" do
      card = Oystercard.new
      expect{ card.touch_out("Kings Cross")}.to change{card.balance}.by (-4)
    end

    it "stores the entry and exit stations as a hash" do
      card = Oystercard.new
      card.top_up(10)
      card.touch_in("New Cross")
      card.touch_out("London Bridge")
      expect(card.journey_tracker).to eq [{ :entry_station => "New Cross", :exit_station => "London Bridge" }]
    end

  end





end
