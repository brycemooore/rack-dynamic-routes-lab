class Application

    @@items = []

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            item_name = req.path.split("/items/").last
            item = @@items.find{|item| item.name == item_name}
            if item == nil
                resp.status = 400
                resp.write("We don't have your item")
            else
                resp.status = 200
                resp.write(item.price)
            end
        else
            resp.write "Route not found"
            resp.status = 404
        end 

    end 
end 
