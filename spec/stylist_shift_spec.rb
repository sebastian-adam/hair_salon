require('spec_helper')

describe(StylistShift) do
  describe('#mon') do
    it('returns true if a stylist is scheduled for the monday shift') do
      stylist_shift1 = StylistShift.new({:id => nil, :mon => true, :tue => true, :wed => false, :thu => false, :fri => false, :stylist_id => 1})
      expect(stylist_shift1.mon()).to(eq(true))
    end
  end

  describe('#tue') do
    it('returns true if a stylist is scheduled for the tuesday shift') do
      stylist_shift1 = StylistShift.new({:id => nil, :mon => true, :tue => true, :wed => false, :thu => false, :fri => false, :stylist_id => 1})
      expect(stylist_shift1.tue()).to(eq(true))
    end
  end

  describe('#wed') do
    it('returns true if a stylist is scheduled for the wednesday shift') do
      stylist_shift1 = StylistShift.new({:id => nil, :mon => true, :tue => true, :wed => false, :thu => false, :fri => false, :stylist_id => 1})
      expect(stylist_shift1.wed()).to(eq(false))
    end
  end

  describe('#thu') do
    it('returns true if a stylist is scheduled for the thursday shift') do
      stylist_shift1 = StylistShift.new({:id => nil, :mon => true, :tue => true, :wed => false, :thu => false, :fri => false, :stylist_id => 1})
      expect(stylist_shift1.thu()).to(eq(false))
    end
  end

  describe('#fri') do
    it('returns true if a stylist is scheduled for the friday shift') do
      stylist_shift1 = StylistShift.new({:id => nil, :mon => true, :tue => true, :wed => false, :thu => false, :fri => false, :stylist_id => 1})
      expect(stylist_shift1.fri()).to(eq(false))
    end
  end
  #
  # describe('.all') do
  #   it('starts off as an empty array') do
  #     expect(Stylist.all().to(eq([])))
  #   end
  # end

  # describe('#id') do
  #   it('returns the id of a stylist shift') do
  #     stylist_shift1 = StylistShift.new({:id => nil, :mon => true, :tue => true, :wed => false, :thu => false, :fri => false, :stylist_id => 1})
  #     expect(stylist_shift1.id()).to(be_an_instance_of(Fixnum))
  #   end
  # end
end
