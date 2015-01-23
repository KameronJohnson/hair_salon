class Client

  attr_reader(:client_name, :client_id)

  define_method(:initialize) do |attributes|
    @client_name = attributes.fetch(:client_name)
    @client_id = attributes.fetch(:client_id)
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each() do |client|
      client_name = client.fetch("client_name")
      client_id = client.fetch("client_id").to_i()
      clients.push(Client.new({:client_name => client_name, :client_id => client_id}))
    end
    clients
  end

  define_method(:save) do
    DB.exec("INSERT INTO clients (client_name, client_id) VALUES ('#{@client_name}', #{@client_id});")
  end

  define_method(:==) do |another_client|
    self.client_name().==(another_client.client_name()).&(self.client_id().==(another_client.client_id()))
  end
end
