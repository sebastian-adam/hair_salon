require('sinatra')
require('sinatra/reloader')
require('./lib/client')
require('./lib/stylist')
require('pg')
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => 'hair_salon'})

get('/') do
  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:index)
end

post('/stylists') do
  first_name = params.fetch('first_name')
  last_name = params.fetch('last_name')
  phone_num = params.fetch('phone_num')
  stylist = Stylist.new({:id => nil, :first_name => first_name, :last_name => last_name, :phone_num => phone_num})
  stylist.save()
  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:index)
end

post('/clients') do
  first_name = params.fetch('first_name_client')
  last_name = params.fetch('last_name_client')
  phone_num = params.fetch('phone_num_client')
  typical_package = params.fetch('typical_package')
  stylist_id = params.fetch('stylist_id')
  client = Client.new({:id => nil, :first_name => first_name, :last_name => last_name, :phone_num => phone_num, :typical_package => typical_package, :stylist_id => stylist_id})
  client.save()
  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:index)
end

get('/stylists/:id') do
  @stylist = Stylist.find(params.fetch('id').to_i())
  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:stylist)
end

get('/clients/:id') do
  @client = Client.find(params.fetch('id').to_i())
  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:client)
end

patch('/stylists/:id') do
  first_name = params.fetch('first_name')
  last_name = params.fetch('last_name')
  phone_num = params.fetch('phone_num')
  @stylist = Stylist.find(params.fetch('id').to_i())
  @stylist.update({:first_name => first_name, :last_name => last_name, :phone_num => phone_num})
  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:stylist)
end

patch('/clients/:id') do
  first_name = params.fetch('first_name')
  last_name = params.fetch('last_name')
  phone_num = params.fetch('phone_num')
  typical_package = params.fetch('typical_package')
  stylist_id = params.fetch('stylist_id').to_i()
  @client = Client.find(params.fetch('id').to_i())
  @client.update({:first_name => first_name, :last_name => last_name, :phone_num => phone_num, :typical_package => typical_package, :stylist_id => stylist_id})
  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:client)
end

delete('/stylists/:id') do
  @stylist = Stylist.find(params.fetch('id').to_i())
  @client = Client.find(@stylist.id())
  @stylist.delete()
  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:index)
end

delete('/clients/:id') do
  @client = Client.find(params.fetch('id').to_i())
  @client.delete()
  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:index)
end
