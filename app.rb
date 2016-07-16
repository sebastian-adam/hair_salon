require('sinatra')
require('sinatra/reloader')
require('./lib/client')
require('./lib/stylist')
require('./lib/stylist_shift')
require('pg')
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => 'hair_salon_test'})

get('/') do
  @stylists = Stylist.all()
  erb(:index)
end

post('/stylists') do
  first_name = params.fetch('first_name')
  last_name = params.fetch('last_name')
  phone_num = params.fetch('phone_num')
  stylist = Stylist.new({:id => nil, :first_name => first_name, :last_name => last_name, :phone_num => phone_num})
  stylist.save()
  @stylists = Stylist.all()
  erb(:index)
end

patch('/stylists/:id') do
  first_name = params.fetch('first_name')
  last_name = params.fetch('last_name')
  phone_num = params.fetch('phone_num')
  @stylist = Stylist.find(params.fetch('id').to_i())
  @stylist.update({:first_name => first_name, :last_name => last_name, :phone_num => phone_num})
  @stylists = Stylist.all()
  erb(:index)
end

delete('/stylists/:id') do
  @stylist = Stylist.find(params.fetch('id').to_i())
  @stylist.delete()
  @stylists = Stylist.all()
  erb(:index)
end
