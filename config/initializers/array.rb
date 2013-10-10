class Array
  def find_in_query_result(field, value)
    select{ |el| el.send(field) == value }
  end
end


