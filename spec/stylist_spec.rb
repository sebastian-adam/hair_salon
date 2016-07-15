require('spec_helper')

describe(Stylist) do
  describe('#first_name') do
    it('returns the first name of a stylist') do
      stylist1 = Stylist.new({:id => nil, :first_name => 'Betty', :last_name => 'Rogers', :phone_num => '1112223333'})
      expect(stylist1.first_name()).to(eq('Betty'))
    end
  end

  describe('#last_name') do
    it('returns the last name of a stylist') do
      stylist1 = Stylist.new({:id => nil, :first_name => 'Betty', :last_name => 'Rogers', :phone_num => '1112223333'})
      expect(stylist1.last_name()).to(eq('Rogers'))
    end
  end

  describe('#phone_num') do
    it('returns the phone number of a stylist') do
      stylist1 = Stylist.new({:id => nil, :first_name => 'Betty', :last_name => 'Rogers', :phone_num => '1112223333'})
      expect(stylist1.phone_num()).to(eq('1112223333'))
    end
  end

  describe('.all') do
    it('starts off as an empty array') do
      expect(Stylist.all()).to(eq([]))
    end
  end

  # describe('#id') do
  #   it('returns the id of a stylist') do
  #     stylist1 = Stylist.new({:id => nil, :first_name => 'Betty', :last_name => 'Rogers', :phone_num => '1112223333'})
  #     expect(stylist1.id()).to(be_an_instance_of(Fixnum))
  #   end
  # end

end
