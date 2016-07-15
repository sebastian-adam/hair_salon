class StylistShift
  attr_reader(:id, :mon, :tue, :wed, :thu, :fri, :stylist_shift_id)

  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @mon = attributes.fetch(:mon)
    @tue = attributes.fetch(:tue)
    @wed = attributes.fetch(:wed)
    @thu = attributes.fetch(:thu)
    @fri = attributes.fetch(:fri)
    @stylist_id = attributes.fetch(:stylist_id)
  end

  define_singleton_method(:all) do
    returned_stylist_shifts = DB.exec("SELECT * FROM stylist_shifts ORDER BY stylist_id ASC;")
    stylist_shifts = []
    returned_stylist_shifts.each() do |stylist_shift|
      id = stylist_shift.fetch('id').to_i
      mon = stylist_shift.fetch('mon')
      tue = stylist_shift.fetch('tue')
      wed = stylist_shift.fetch('wed')
      thu = stylist_shift.fetch('thu')
      fri = stylist_shift.fetch('fri')
      stylist_id = stylist_shift.fetch('stylist_id')
      stylist_shift_shifts.push(Stylist.new({:id => id, :mon => mon, :tue => tue, :wed => wed, :thu => thu, :fri => fri, :stylist_id => stylist_id}))
    end
    stylist_shifts
  end
end
