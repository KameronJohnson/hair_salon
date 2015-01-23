require('spec_helper')

describe(Stylist) do

  describe(".all") do
    it("starts off with no lists") do
      expect(Stylist.all()).to(eq([]))
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
    it("is the same list if it has the same name") do
      stylist1 = Stylist.new({:stylist_name => "Jimmy", :stylist_id => nil})
      stylist2 = Stylist.new({:stylist_name => "Jimmy", :stylist_id => nil})
      expect(stylist1).to(eq(stylist2))
    end
  end
end
