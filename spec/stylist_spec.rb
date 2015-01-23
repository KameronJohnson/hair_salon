require('spec_helper')

describe(Stylist) do

  describe(".all") do
    it("starts off with no lists") do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe(".find_stylist") do
    it("returns stylists by ID number") do
      test_stylist = Stylist.new({:stylist_name => "Jimmy", :stylist_id => nil})
      test_stylist.save()
      test_stylist2 = Stylist.new({:stylist_name => "Meg", :stylist_id => nil})
      test_stylist2.save()
      expect(Stylist.find_stylist(test_stylist2.stylist_id())).to(eq(test_stylist2))
    end
  end

  describe("#stylist_name") do
    it("tells you the stylist's name") do
      stylist = Stylist.new({:stylist_name => "Jimmy", :stylist_id => nil})
      expect(stylist.stylist_name()).to(eq("Jimmy"))
    end
  end

  describe("#stylist_id") do
    it("sets its ID when you save it") do
      stylist = Stylist.new({:stylist_name => "Jimmy", :stylist_id => nil})
      stylist.save()
      expect(stylist.stylist_id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it("lets you save stylists to the database") do
      stylist = Stylist.new({:stylist_name => "Jimmy", :stylist_id => nil})
      stylist.save()
      expect(Stylist.all()).to(eq([stylist]))
    end
  end

  describe("#==") do
    it("is the same list if it has the same info") do
      stylist1 = Stylist.new({:stylist_name => "Jimmy", :stylist_id => nil})
      stylist2 = Stylist.new({:stylist_name => "Jimmy", :stylist_id => nil})
      expect(stylist1).to(eq(stylist2))
    end
  end

   describe("#clients") do
    it("returns an array of clients for that stylist") do
      test_stylist = Stylist.new({:stylist_name => "Jimmy", :stylist_id => nil})
      test_stylist.save()
      test_client = Client.new({:client_name => "Bobby", :client_id => test_stylist.stylist_id()})
      test_client.save()
      test_client2 = Client.new({:client_name => "Jose", :client_id => test_stylist.stylist_id()})
      test_client2.save()
      expect(test_stylist.clients()).to(eq([test_client, test_client2]))
    end
  end
end
