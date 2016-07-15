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
  #
  # describe('#first_name') do
  #   it('returns the first name of a client') do
  #     client1 = Client.new({:id => nil, :first_name => 'Sue', :last_name => 'Davis', :phone_num => '7778889999', :typical_package => 'shampoo and trim', :stylist_id => 1})
  #     expect(client1.first_name()).to(eq('Sue'))
  #   end
  # end
  # describe('.all') do
  #   it('starts off as an empty array') do
  #     expect(Client.all().to(eq([])))
  #   end
  # end

end
