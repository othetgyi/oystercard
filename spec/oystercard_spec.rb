require 'oystercard'

describe Oystercard do

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

  it "can touch in" do
    card = Oystercard.new
    card.touch_in
    expect(card).to be_in_journey
  end

  it "can touch out" do
    card = Oystercard.new
    card.touch_out
    expect(card).not_to be_in_journey
  end

  describe "#deduct" do
    it 'subtracts money from the balance' do
      card = Oystercard.new
      expect(card.deduct(2)).to eq(-2)
    end
  end
end
