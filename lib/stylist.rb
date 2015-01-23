class Stylist
  attr_reader(:stylist_name, :stylist_id)

  define_method(:initialize) do |attributes|
    @stylist_name = attributes.fetch(:stylist_name)
    @stylist_id = attributes.fetch(:stylist_id)
  end

  define_singleton_method(:all) do
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    stylists = []
    returned_stylists.each() do |stylist|
      stylist_name = stylist.fetch("stylist_name")
      stylist_id = stylist.fetch("stylist_id").to_i()
      stylists.push(Stylist.new({:stylist_name => stylist_name, :stylist_id => stylist_id}))
    end
    stylists
  end

  define_singleton_method(:find_stylist) do |id|
    found_stylist = nil
    Stylist.all().each() do |stylist|
      if stylist.stylist_id().==(id)
        found_stylist = stylist
      end
    end
    found_stylist
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stylists (stylist_name) VALUES ('#{@stylist_name}') RETURNING stylist_id;")
    @stylist_id = result.first().fetch("stylist_id").to_i()
  end

  define_method(:==) do |another_stylist|
    self.stylist_name().==(another_stylist.stylist_name()).&(self.stylist_id().==(another_stylist.stylist_id()))
  end

  define_method(:clients) do
    list_clients = []
    clients = DB.exec("SELECT * FROM clients WHERE client_id = #{self.stylist_id()}ORDER BY client_name;")
    clients.each() do |client|
      client_name = client.fetch("client_name")
      client_id = client.fetch("client_id").to_i()
      list_clients.push(Client.new({:client_name => client_name, :client_id => client_id}))
    end
    list_clients
  end
end
