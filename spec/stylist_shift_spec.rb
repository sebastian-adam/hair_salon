require('spec_helper')

describe(StylistShift) do
  describe('#mon') do
    it('returns "t" if a stylist is scheduled for the monday shift') do
      stylist_shift1 = StylistShift.new({:id => nil, :mon => "t", :tue => "t", :wed => "f", :thu => "f", :fri => "f", :client_appt => "monday", :client_id => 1, :stylist_id => 1})
      expect(stylist_shift1.mon()).to(eq("t"))
    end
  end

  describe('#tue') do
    it('returns "t" if a stylist is scheduled for the tuesday shift') do
      stylist_shift1 = StylistShift.new({:id => nil, :mon => "t", :tue => "t", :wed => "f", :thu => "f", :fri => "f", :client_appt => "monday", :client_id => 1, :stylist_id => 1})
      expect(stylist_shift1.tue()).to(eq("t"))
    end
  end

  describe('#wed') do
    it('returns "t" if a stylist is scheduled for the wednesday shift') do
      stylist_shift1 = StylistShift.new({:id => nil, :mon => "t", :tue => "t", :wed => "f", :thu => "f", :fri => "f", :client_appt => "monday", :client_id => 1, :stylist_id => 1})
      expect(stylist_shift1.wed()).to(eq("f"))
    end
  end

  describe('#thu') do
    it('returns "t" if a stylist is scheduled for the thursday shift') do
      stylist_shift1 = StylistShift.new({:id => nil, :mon => "t", :tue => "t", :wed => "f", :thu => "f", :fri => "f", :client_appt => "monday", :client_id => 1, :stylist_id => 1})
      expect(stylist_shift1.thu()).to(eq("f"))
    end
  end

  describe('#fri') do
    it('returns "t" if a stylist is scheduled for the friday shift') do
      stylist_shift1 = StylistShift.new({:id => nil, :mon => "t", :tue => "t", :wed => "f", :thu => "f", :fri => "f", :client_appt => "monday", :client_id => 1, :client_id => 1, :stylist_id => 1})
      expect(stylist_shift1.fri()).to(eq("f"))
    end
  end

  describe('#client_appt') do
    it('returns the day of the week a client is scheduled an appt') do
      stylist_shift1 = StylistShift.new({:id => nil, :mon => "t", :tue => "t", :wed => "f", :thu => "f", :fri => "f", :client_appt => "f", :client_appt => "monday", :client_id => 1, :stylist_id => 1})
      expect(stylist_shift1.client_appt()).to(eq("monday"))
    end
  end

  describe('#client_id') do
    it('returns the client id of a stylist shift') do
      stylist_shift1 = StylistShift.new({:id => nil, :mon => "t", :tue => "t", :wed => "f", :thu => "f", :fri => "f", :client_appt => "monday", :client_id => 1, :stylist_id => 1})
      expect(stylist_shift1.client_id()).to(eq(1))
    end
  end

  describe('#stylist_id') do
    it('returns the stylist id of a stylist shift') do
      stylist_shift1 = StylistShift.new({:id => nil, :mon => "t", :tue => "t", :wed => "f", :thu => "f", :fri => "f", :client_appt => "monday", :client_id => 1, :client_id => 1, :stylist_id => 1})
      expect(stylist_shift1.stylist_id()).to(eq(1))
    end
  end

  describe('.all') do
    it('starts off as an empty array') do
      expect(StylistShift.all()).to(eq([]))
    end
  end

  describe('#==') do
    it('is the same stylist shift if it has the same attributes') do
      stylist_shift1 = StylistShift.new({:id => nil, :mon => "t", :tue => "t", :wed => "f", :thu => "f", :fri => "f", :client_appt => "monday", :client_id => 1, :stylist_id => 1})
      stylist_shift2 = StylistShift.new({:id => nil, :mon => "t", :tue => "t", :wed => "f", :thu => "f", :fri => "f", :client_appt => "monday", :client_id => 1, :stylist_id => 1})
      expect(stylist_shift1).to(eq(stylist_shift2))
    end
  end

  describe('#save') do
    it('lets user save the Stylist Shift object to the database') do
      stylist_shift1 = StylistShift.new({:id => nil, :mon => "t", :tue => "t", :wed => "f", :thu => "f", :fri => "f", :client_appt => "monday", :client_id => 1, :stylist_id => 1})
      stylist_shift1.save()
      expect(StylistShift.all()).to(eq([stylist_shift1]))
    end
  end

  describe('#id') do
    it('returns the id of a stylist shift') do
      stylist_shift1 = StylistShift.new({:id => nil, :mon => "t", :tue => "t", :wed => "f", :thu => "f", :fri => "f", :client_appt => "monday", :client_id => 1, :stylist_id => 1})
      stylist_shift1.save()
      expect(stylist_shift1.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('.find') do
    it('returns a stylist shift by its id') do
      stylist_shift1 = StylistShift.new({:id => nil, :mon => "t", :tue => "t", :wed => "f", :thu => "f", :fri => "f", :client_appt => "monday", :client_id => 1, :stylist_id => 1})
      stylist_shift1.save()
      stylist_shift2 = StylistShift.new({:id => nil, :mon => "f", :tue => "f", :wed => "t", :thu => "t", :fri => "t", :client_appt => "monday", :client_id => 1, :stylist_id => 1})
      stylist_shift2.save()
      expect(StylistShift.find(stylist_shift1.id())).to(eq(stylist_shift1))
    end
  end

end
