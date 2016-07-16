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
