class Stylist
  attr_reader(:id, :first_name, :last_name, :phone_num)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @phone_num = attributes.fetch(:phone_num)
  end

  define_singleton_method(:all) do
    returned_stylists = DB.exec("SELECT * FROM stylists ORDER BY last_name ASC;")
    stylists = []
    returned_stylists.each() do |stylist|
      id = stylist.fetch('id').to_i
      first_name = stylist.fetch('first_name')
      last_name = stylist.fetch('last_name')
      phone_num = stylist.fetch('phone_num')
      stylists.push(Stylist.new({:id => id, :first_name => first_name, :last_name => last_name, :phone_num => phone_num}))
    end
    stylists
  end

end
