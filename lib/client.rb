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

  
end
