class Application

@@items = [Item.new("Figs", 3.00), Item.new("Orange", 1.00)]

  def call(env)

    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      if item = @@items.find{|i| i.name == item_name}
        resp.write item.price
    else
      resp.status = 400
      resp.write "Item not found"
    end
  else
    resp.status = 404
    resp.write "Route not found"
  end
  resp.finish
end

end
