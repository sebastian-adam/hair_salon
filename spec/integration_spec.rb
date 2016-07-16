require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('view stylist path', {:type => :feature}) do
  it('shows the user the list of stylists in the database') do
    visit('/')
    expect(page).to have_content('There are no stylists in the database.')
    stylist1 = Stylist.new({:id => nil, :first_name => 'Betty', :last_name => 'Rogers', :phone_num => '1112223333'})
    stylist1.save()
    visit('/')
    expect(page).to have_content(stylist1.first_name())
  end
end

describe('add stylist path', {:type => :feature}) do
  it('allows user to add a new stylist') do
    visit('/')
    fill_in('first_name', :with => 'Kim')
    fill_in('last_name', :with => 'Davis')
    fill_in('phone_num', :with => '111222333')
    click_button('Add stylist')
    expect(page).to have_content("Kim Davis 111222333")
  end
end

describe('edit stylist path', {:type => :feature}) do
  it('allows user to edit a stored stylist') do
    stylist1 = Stylist.new({:id => nil, :first_name => 'Betty', :last_name => 'Rogers', :phone_num => '1112223333'})
    stylist1.save()
    visit('/')
    click_on("#{stylist1.first_name()} #{stylist1.last_name()}")
    click_button('EDIT')
    fill_in('first_name', :with => 'Jen')
    fill_in('last_name', :with => 'Smith')
    fill_in('phone_num', :with => '3334445555')
    click_button('Save Changes')
    expect(page).to have_content("Jen Smith 3334445555")
  end
end

describe('delete stylist path', {:type => :feature}) do
  it('allows the user to delete a stylist in the database') do
    stylist1 = Stylist.new({:id => nil, :first_name => 'Betty', :last_name => 'Rogers', :phone_num => '1112223333'})
    stylist1.save()
    visit('/')
    click_button('REMOVE')
    expect(page).to have_no_content(stylist1.first_name())
  end
end

describe('view client path', {:type => :feature}) do
  it('shows the user the list of clients in the database') do
    stylist1 = Stylist.new({:id => nil, :first_name => 'Betty', :last_name => 'Rogers', :phone_num => '1112223333'})
    stylist1.save()
    visit('/')
    expect(page).to have_content('There are no clients in the database.')
    client1 = Client.new({:id => nil, :first_name => 'Sue', :last_name => 'Davis', :phone_num => '7778889999', :typical_package => 'shampoo and trim', :stylist_id => 1})
    client1.save()
    visit('/')
    expect(page).to have_content(client1.first_name())
  end
end

describe('add client path', {:type => :feature}) do
  it('allows user to add a new client') do
    stylist1 = Stylist.new({:id => nil, :first_name => 'Betty', :last_name => 'Rogers', :phone_num => '1112223333'})
    stylist1.save()
    visit('/')
    fill_in('first_name_client', :with => 'Kim')
    fill_in('last_name_client', :with => 'Davis')
    fill_in('phone_num_client', :with => '111222333')
    select "Cut and Style", :from => "typical_package"
    select "#{stylist1.first_name()} #{stylist1.last_name()}", :from => "stylist_id"
    click_button('Add client')
    expect(page).to have_content("Kim Davis 111222333 Cut and Style Betty Rogers")
  end
end

describe('edit client path', {:type => :feature}) do
  it('allows user to edit a stored client') do
    stylist1 = Stylist.new({:id => nil, :first_name => 'Betty', :last_name => 'Rogers', :phone_num => '1112223333'})
    stylist1.save()
    stylist2 = Stylist.new({:id => nil, :first_name => 'Sam', :last_name => 'Hammy', :phone_num => '3334445555'})
    stylist2.save()
    client1 = Client.new({:id => nil, :first_name => 'Sue', :last_name => 'Davis', :phone_num => '7778889999', :typical_package => 'shampoo and trim', :stylist_id => 1})
    client1.save()
    visit('/')
    click_on("#{client1.first_name()} #{client1.last_name()}")
    click_button('EDIT')
    fill_in('first_name', :with => 'Jen')
    fill_in('last_name', :with => 'Smith')
    fill_in('phone_num', :with => '3334445555')
    select "Highlights", :from => "typical_package"
    select "#{stylist2.first_name()} #{stylist2.last_name()}", :from => "stylist_id"
    click_button('Save Changes')
    expect(page).to have_content("Jen Smith 3334445555")
    expect(page).to have_content("Highlights")
    expect(page).to have_content("Sam Hammy")
  end
end

describe('delete client path', {:type => :feature}) do
  it('allows the user to delete a client in the database') do
    stylist1 = Stylist.new({:id => nil, :first_name => 'Betty', :last_name => 'Rogers', :phone_num => '1112223333'})
    stylist1.save()
    client1 = Client.new({:id => nil, :first_name => 'Sue', :last_name => 'Davis', :phone_num => '7778889999', :typical_package => 'shampoo and trim', :stylist_id => 1})
    client1.save()
    visit('/')
    click_button('delete_client')
    expect(page).to have_no_content(client1.first_name())
  end
end
