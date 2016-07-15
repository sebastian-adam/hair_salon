require('spec_helper')

describe(Stylist) do
  describe('#first_name') do
    it('returns the first name of a given client') do
      stylist1 = Stylist.new({:id => nil, :first_name => 'Betty', :last_name => 'Rogers', :phone_num => '1112223333'})
      expect(stylist1.first_name()).to(eq('Betty'))
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
  # describe('.all') do
  #   it('starts off as an empty array') do
  #     expect(Stylist.all().to(eq([])))
  #   end
  # end

end
