class Client
  attr_reader(:id, :first_name, :last_name, :phone_num, :typical_package, :stylist_id)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @phone_num = attributes.fetch(:phone_num)
    @typical_package = attributes.fetch(:typical_package)
    @stylist_id = attributes.fetch(:stylist_id)
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients ORDER BY last_name ASC;")
    clients = []
    returned_clients.each() do |client|
      id = client.fetch('id').to_i
      first_name = client.fetch('first_name')
      last_name = client.fetch('last_name')
      phone_num = client.fetch('phone_num')
      typical_package = client.fetch('typical_package')
      stylist_id = client.fetch('stylist_id')
      clients.push(Client.new({:id => id, :first_name => first_name, :last_name => last_name, :phone_num => phone_num, :typical_package => typical_package, :stylist_id => stylist_id}))
    end
    clients
  end

end
