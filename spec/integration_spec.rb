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
    expect(page).to have_content("Kim Davis 111222333 Cut and Style")
  end
end
