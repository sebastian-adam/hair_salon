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

  define_method(:==) do |another_stylist|
    self.id().==(another_stylist.id()).&(self.first_name().==(another_stylist.first_name())).&(self.last_name().==(another_stylist.last_name())).&(self.phone_num().==(another_stylist.phone_num()))
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stylists (first_name, last_name, phone_num) VALUES ('#{@first_name}', '#{@last_name}', '#{@phone_num}') RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end

end
