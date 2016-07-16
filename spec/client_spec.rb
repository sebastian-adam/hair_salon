require('spec_helper')

describe(Client) do
  describe('#first_name') do
    it('returns the first name of a client') do
      client1 = Client.new({:id => nil, :first_name => 'Sue', :last_name => 'Davis', :phone_num => '7778889999', :typical_package => 'shampoo and trim', :stylist_id => 1})
      expect(client1.first_name()).to(eq('Sue'))
    end
  end

  describe('#last_name') do
    it('returns the last name of a client') do
      client1 = Client.new({:id => nil, :first_name => 'Sue', :last_name => 'Davis', :phone_num => '7778889999', :typical_package => 'shampoo and trim', :stylist_id => 1})
      expect(client1.last_name()).to(eq('Davis'))
    end
  end

  describe('#phon_num') do
    it('returns the phone number of a client') do
      client1 = Client.new({:id => nil, :first_name => 'Sue', :last_name => 'Davis', :phone_num => '7778889999', :typical_package => 'shampoo and trim', :stylist_id => 1})
      expect(client1.phone_num()).to(eq('7778889999'))
    end
  end

  describe('#typical_package') do
    it('returns the typical package of a client') do
      client1 = Client.new({:id => nil, :first_name => 'Sue', :last_name => 'Davis', :phone_num => '7778889999', :typical_package => 'shampoo and trim', :stylist_id => 1})
      expect(client1.typical_package()).to(eq('shampoo and trim'))
    end
  end

  describe('#stylist_id') do
    it('returns the stylist id of a client') do
      client1 = Client.new({:id => nil, :first_name => 'Sue', :last_name => 'Davis', :phone_num => '7778889999', :typical_package => 'shampoo and trim', :stylist_id => 1})
      expect(client1.stylist_id()).to(eq(1))
    end
  end

  describe('.all') do
    it('starts off as an empty array') do
      expect(Client.all()).to(eq([]))
    end
  end

  describe('#==') do
    it('is the same client if it has the same attributes') do
      client1 = Client.new({:id => nil, :first_name => 'Sue', :last_name => 'Davis', :phone_num => '7778889999', :typical_package => 'shampoo and trim', :stylist_id => 1})
      client2 = Client.new({:id => nil, :first_name => 'Sue', :last_name => 'Davis', :phone_num => '7778889999', :typical_package => 'shampoo and trim', :stylist_id => 1})
      expect(client1).to(eq(client2))
    end
  end

  describe('#save') do
    it('lets user save the Client object to the database') do
      client1 = Client.new({:id => nil, :first_name => 'Sue', :last_name => 'Davis', :phone_num => '7778889999', :typical_package => 'shampoo and trim', :stylist_id => 1})
      client1.save()
      expect(Client.all()).to(eq([client1]))
    end
  end


  describe('#id') do
    it('returns the id of a client') do
      client1 = Client.new({:id => nil, :first_name => 'Sue', :last_name => 'Davis', :phone_num => '7778889999', :typical_package => 'shampoo and trim', :stylist_id => 1})
      client1.save()
      expect(client1.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('.find') do
    it('returns a client by its id') do
      client1 = Client.new({:id => nil, :first_name => 'Sue', :last_name => 'Davis', :phone_num => '7778889999', :typical_package => 'shampoo and trim', :stylist_id => 1})
      client1.save()
      client2 = Client.new({:id => nil, :first_name => 'Debbie', :last_name => 'Smith', :phone_num => '6667778888', :typical_package => 'bleach and cut', :stylist_id => 1})
      client2.save()
      expect(Client.find(client1.id())).to(eq(client1))
    end
  end

  describe('#update') do
    it('lets user update a client in the database') do
      client1 = Client.new({:id => nil, :first_name => 'Sue', :last_name => 'Davis', :phone_num => '7778889999', :typical_package => 'shampoo and trim', :stylist_id => 1})
      client1.save()
      client1.update({:id => nil, :first_name => 'Debbie', :last_name => 'Smith', :phone_num => '6667778888', :typical_package => 'bleach and cut', :stylist_id => 1})
      expect(client1.first_name()).to(eq('Debbie'))
    end
  end

  describe('#delete') do
    it('lets user delete a client from the database') do
      client1 = Client.new({:id => nil, :first_name => 'Sue', :last_name => 'Davis', :phone_num => '7778889999', :typical_package => 'shampoo and trim', :stylist_id => 1})
      client1.save()
      client2 = Client.new({:id => nil, :first_name => 'Debbie', :last_name => 'Smith', :phone_num => '6667778888', :typical_package => 'bleach and cut', :stylist_id => 1})
      client2.save()
      client1.delete()
      expect(Client.all()).to(eq([client2]))
    end
  end

end
