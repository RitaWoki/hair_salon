require('spec_helper')

describe(Stylist) do
  describe('.all') do
    it('returns no stylists in the list of stylists') do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe('#name') do
    it('tells you the name of the stylist') do
      test_stylist = Stylist.new({:name => "Dennis Rodman", :id => nil})
      expect(test_stylist.name()).to(eq("Dennis Rodman"))
    end
  end

  describe('#save') do
    it('saves the stylists') do
      test_stylist = Stylist.new({:name => "Dennis Rodman", :id => nil})
      test_stylist.save()
      expect(Stylist.all()).to(eq([test_stylist]))
    end
  end

  describe('#==') do
    it('is the same stylist if it has the same id and stylist') do
      test_stylist = Stylist.new({:name => "Dennis Rodman", :id => nil})
      test_stylist2 = Stylist.new({:name => "Dennis Rodman", :id => nil})
      expect(test_stylist).to(eq(test_stylist2))
    end
  end

  describe("#id") do
    it("sets its ID when you save") do
      test_stylist = Stylist.new({:name => "Dennis Rodman", :id => nil})
      test_stylist.save()
      expect(test_stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe(".find") do
    it("returns an stylist by their ID") do
      test_stylist = Stylist.new({:name => "Dennis Rodman", :id => nil})
      test_stylist.save()
      test_stylist2 = Stylist.new({:name => "Ron Artest", :id => nil})
      test_stylist2.save()
      expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
    end
  end

  describe("#update") do
      it("lets you update stylists in the database") do
        test_stylist = Stylist.new({:name => "Bob the Builder", :id => nil})
        test_stylist.save()
        test_stylist.update({:name => "Lilian"})
        expect(test_stylist.name()).to(eq("Lilian"))
      end
    end

    describe("#delete") do
      it("lets you delete a stylist from the database") do
        test_stylist = Stylist.new({:name => "Randy Savage", :id => nil})
        test_stylist.save()
        test_stylist2 = Stylist.new({:name => "Katy Perry", :id => nil})
        test_stylist2.save()
        test_stylist.delete()
        expect(Stylist.all()).to(eq([test_stylist2]))
      end
    end

end
