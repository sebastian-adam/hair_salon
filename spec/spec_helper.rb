require('rspec')
require('pg')
require('client')
require('stylist')
require('stylist_shift')

DB = PG.connect({:dbname => 'hair_salon_test'})

RSpec.configure do |config|
  config.before(:each) do
    DB.exec('DELETE FROM stylists *;')
    DB.exec('DELETE FROM clients *;')
    DB.exec('DELETE FROM stylist_shifts *;')
  end
  config.after(:each) do
    DB.exec('DELETE FROM stylists *;')
    DB.exec('DELETE FROM clients *;')
    DB.exec('DELETE FROM stylist_shifts *;')
  end
end
