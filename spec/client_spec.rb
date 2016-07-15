require('spec_helper')

describe(Client) do
  describe('#first_name') do
    it('returns the first name of a given client') do
      client1 = Client.new({:id => nil, :first_name => 'Sue', :last_name => 'Davis', :phone_num => '7778889999', :typical_package => 'shampoo and trim', :stylist_id => 1})
      expect(client1.first_name()).to(eq('Sue'))
    end
  end

  # describe('#first_name') do
  #   it('returns the first name of a given client') do
  #     client1 = Client.new({:id => nil, :first_name => 'Sue', :last_name => 'Davis', :phone_num => '7778889999', :typical_package => 'shampoo and trim', :stylist_id => 1})
  #     expect(client1.first_name()).to(eq('Sue'))
  #   end
  # end
  #
  # describe('#first_name') do
  #   it('returns the first name of a given client') do
  #     client1 = Client.new({:id => nil, :first_name => 'Sue', :last_name => 'Davis', :phone_num => '7778889999', :typical_package => 'shampoo and trim', :stylist_id => 1})
  #     expect(client1.first_name()).to(eq('Sue'))
  #   end
  # end
  #
  # describe('#first_name') do
  #   it('returns the first name of a given client') do
  #     client1 = Client.new({:id => nil, :first_name => 'Sue', :last_name => 'Davis', :phone_num => '7778889999', :typical_package => 'shampoo and trim', :stylist_id => 1})
  #     expect(client1.first_name()).to(eq('Sue'))
  #   end
  # end
  #
  # describe('#first_name') do
  #   it('returns the first name of a given client') do
  #     client1 = Client.new({:id => nil, :first_name => 'Sue', :last_name => 'Davis', :phone_num => '7778889999', :typical_package => 'shampoo and trim', :stylist_id => 1})
  #     expect(client1.first_name()).to(eq('Sue'))
  #   end
  # end
  #
  # describe('#first_name') do
  #   it('returns the first name of a given client') do
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
