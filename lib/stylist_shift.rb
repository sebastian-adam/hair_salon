class StylistShift
  attr_reader(:id, :mon, :tue, :wed, :thu, :fri, :stylist_id)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @mon = attributes.fetch(:mon)
    @tue = attributes.fetch(:tue)
    @wed = attributes.fetch(:wed)
    @thu = attributes.fetch(:thu)
    @fri = attributes.fetch(:fri)
    @stylist_id = attributes.fetch(:stylist_id)
  end

end
