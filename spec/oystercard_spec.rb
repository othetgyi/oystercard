require 'oystercard'

describe Oystercard do

  it 'creates a card with a balance of 0' do
    card = Oystercard.new
    expect(card.balance).to eq(0)
  end

end
