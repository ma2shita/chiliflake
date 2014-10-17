require "chiliflake"

describe ChiliFlake, "#chiliflake" do
  describe "fixed params" do
    it "all zero" do
      c = ChiliFlake.new(0).send(:chiliflake, ChiliFlake::OFFSET_TS_W_MILLIS, 0, 0)
      expect(c).to eq 0
    end

    it "overflow"  do
      c = ChiliFlake.new(0)
      expect{ c.send(:chiliflake, 2199023255552, 0, 0) }.to raise_error ChiliFlake::OverflowError
      expect{ c.send(:chiliflake, ChiliFlake::OFFSET_TS_W_MILLIS, 1024, 0) }.to raise_error ChiliFlake::OverflowError
      expect(c.send(:chiliflake, ChiliFlake::OFFSET_TS_W_MILLIS, 0, 4096)).to eq 0 # seq is cycliced.
    end
  end

  describe "#new" do
    it "overflow when instance create" do
      expect{ ChiliFlake.new(1024) }.to raise_error ChiliFlake::OverflowError
    end
  end


  describe "#generate" do
    it "Last timestamp was bigger than now" do
      c = ChiliFlake.new(0)
      c.instance_variable_set(:@last_ts, (1 << ChiliFlake::TS_WIDTH) ) # tweak to the previous timestamp
      expect{ c.generate }.to raise_error ChiliFlake::InvalidSystemClockError
    end
  end

  describe "Class methods" do
    it "#parse" do
      h = ChiliFlake.parse(521994635925667840)
      expect(h).to include(:sequence => 0)
      expect(h).to include(:generator_id => 36)
      expect(h).to include(:ts_w_millis => 124453219396)
    end

    it "#time" do
      t = ChiliFlake.time(521994635925667840)
      expect(t.year).to eq 2014
      expect(t.month).to eq 10
      expect(t.day).to eq 14
      expect(t.hour).to eq 21
      expect(t.min).to eq 3
      expect(t.sec).to eq 14
      expect(t.usec).to eq 52999
    end
  end
end

