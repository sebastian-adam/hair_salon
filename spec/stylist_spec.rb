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

  describe('#==') do
    it('is the same stylist if it has the same attributes') do
      stylist1 = Stylist.new({:id => nil, :first_name => 'Betty', :last_name => 'Rogers', :phone_num => '1112223333'})
      stylist2 = Stylist.new({:id => nil, :first_name => 'Betty', :last_name => 'Rogers', :phone_num => '1112223333'})
      expect(stylist1).to(eq(stylist2))
    end
  end

  describe('#save') do
    it('lets user save the Stylist object to the database') do
      stylist1 = Stylist.new({:id => nil, :first_name => 'Betty', :last_name => 'Rogers', :phone_num => '1112223333'})
      stylist1.save()
      expect(Stylist.all()).to(eq([stylist1]))
    end
  end

  describe('#id') do
    it('returns the id of a stylist') do
      stylist1 = Stylist.new({:id => nil, :first_name => 'Betty', :last_name => 'Rogers', :phone_num => '1112223333'})
      stylist1.save()
      expect(stylist1.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('.find') do
    it('returns a stylist by its id') do
      stylist1 = Stylist.new({:id => nil, :first_name => 'Betty', :last_name => 'Rogers', :phone_num => '1112223333'})
      stylist1.save()
      stylist2 = Stylist.new({:id => nil, :first_name => 'Rachel', :last_name => 'Blake', :phone_num => '2223334444'})
      stylist2.save()
      expect(Stylist.find(stylist1.id())).to(eq(stylist1))
    end
  end

  describe('#update') do
    it('lets user update a stylist in the database') do
      stylist1 = Stylist.new({:id => nil, :first_name => 'Betty', :last_name => 'Rogers', :phone_num => '1112223333'})
      stylist1.save()
      stylist1.update({:id => nil, :first_name => 'Rachel', :last_name => 'Blake', :phone_num => '2223334444'})
      expect(stylist1.first_name()).to(eq('Rachel'))
    end
  end

  describe('#delete') do
    it('lets user delete a stylist from the database') do
      stylist1 = Stylist.new({:id => nil, :first_name => 'Betty', :last_name => 'Rogers', :phone_num => '1112223333'})
      stylist1.save()
      stylist2 = Stylist.new({:id => nil, :first_name => 'Rachel', :last_name => 'Blake', :phone_num => '2223334444'})
      stylist2.save()
      stylist1.delete()
      expect(Stylist.all()).to(eq([stylist2]))
    end
  end

end
