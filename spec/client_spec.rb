require("spec_helper")

describe(Client) do

  describe(".all") do
    it("is empty at first") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a client to the array of saved clients") do
      test_client = Client.new({:client_name => "Jimmy", :client_id => 1})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end

  describe("#client_name") do
    it("lets you read the client name out") do
      test_client = Client.new({:client_name => "Jimmy", :client_id => 1})
      expect(test_client.client_name()).to(eq("Jimmy"))
    end
  end

   describe("#client_id") do
    it("lets you read the client ID out") do
      test_client = Client.new({:client_name => "Jimmy", :client_id => 1})
      expect(test_client.client_id()).to(eq(1))
    end
  end

  describe("#==") do
    it("is the same client if it has the same client info") do
      client1 = Client.new({:client_name => "Jimmy", :client_id => 1})
      client2 = Client.new({:client_name => "Jimmy", :client_id => 1})
      expect(client1).to(eq(client2))
    end
  end
end
