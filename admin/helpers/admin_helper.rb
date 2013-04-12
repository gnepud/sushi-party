Admin.helpers do
  def link_to_add_item(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    item = f.fields_for(association, new_object, child_index: id) do |builder|
      render("item", f: builder)
    end
    link_to(name, '#', class: "add_item btn", data: {id: id, item: item.gsub("\n", "")})
  end
end
