require 'station'

describe Station do
  it 'has New Cross Gate as its first station' do
    station = Station.new
    expect(station.name).to eq("New Cross Gate")
  end

  it 'has Zone 2 as its initial zone' do
    station = Station.new
    expect(station.zone).to eq(2)
  end

end
