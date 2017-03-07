require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('view all stylists', {:type => :feature}) do
  it 'allows user to view all stylists' do
    stylist = Stylist.new({:id => nil, :name => 'Guy Martin'})
    stylist.save()
    visit('/')
    click_link('Check out your stylists')
    expect(page).to have_content(stylist.name())
  end
end

describe('add a new stylist', {:type => :feature}) do
  it 'allows user to add a new stylist' do
    visit('/stylists')
    fill_in('name', :with => 'Jon Jones')
    click_button('Add Stylist')
    expect(page).to have_content('Jon Jones')
  end
end

describe('add a new client', {:type => :feature}) do
  it 'allows user to add a new client on clients page' do
    stylist = Stylist.new({:id => nil, :name => 'Jon Jones'})
    stylist.save()
    visit('/')
    click_link('Check our your clients')
    fill_in('name', :with => 'Ronda')
    select('Jon Jones', :from => 'stylist_id')
    click_button('Add Client')
    expect(page).to have_content('Ronda')
  end
end

describe('add a new client from stylist page', {:type => :feature}) do
  it 'allows user to add a new client on stylist page' do
    stylist = Stylist.new({:id => nil, :name => 'Jon Jones'})
    stylist.save()
    visit('/stylists')
    click_link('Jon Jones')
    fill_in('Client Name', :with => 'Ronda')
    click_button('Add Client')
    expect(page).to have_content('Ronda')
  end
end

describe('view the individual page of a stylist', {:type => :feature}) do
  it 'allows user to see clients and update or delete a stylist' do
    stylist = Stylist.new({:id => nil, :name => 'Daniel Cormier'})
    stylist.save()
    visit('/stylists')
    click_link('Daniel Cormier')
    expect(page).to have_content("Daniel Cormier's Page")
  end
end

describe('update a stylist name', {:type => :feature}) do
  it 'allows user to edit the stylist name' do
    stylist = Stylist.new({:id => nil, :name => 'Daniel Cormier'})
    stylist.save()
    visit('/stylists')
    click_link('Daniel Cormier')
    fill_in('New Name', :with => "Jon Jones")
    click_button('Update')
    expect(page).to have_content("Jon Jones's Page")
  end
end

describe('delete a stylist', {:type => :feature}) do
  it 'allows user to delete a stylist and return to stylists page' do
    stylist = Stylist.new({:id => nil, :name => 'Daniel Cormier'})
    stylist.save()
    visit('/stylists')
    click_link('Daniel Cormier')
    click_button('Delete Stylist')
    expect(page).to have_content("Your stylists")
  end
end

describe('update a client', {:type => :feature}) do
  it 'allows user to edit the client name and stylist' do
    stylist1 = Stylist.new({:id => nil, :name => 'Daniel Cormier'})
    stylist1.save()
    stylist2 = Stylist.new({:id => nil, :name => 'Jon Jones'})
    stylist2.save()
    client = Client.new({:id => nil, :name => "Jose Aldo", :stylist_id => stylist1.id()})
    client.save()
    visit('/clients')
    click_link('Jose Aldo')
    fill_in('New Name', :with => "Jon Jones")
    select('Jon Jones', :from => 'new_stylist_id')
    click_button('Update')
    expect(page).to have_content("Jon Jones's Page")
  end
end

describe('delete a client', {:type => :feature}) do
  it 'allows user to delete a client and return to all clients page' do
    stylist1 = Stylist.new({:id => nil, :name => 'Daniel Cormier'})
    stylist1.save()
    client = Client.new({:id => nil, :name => "Jose Aldo", :stylist_id => stylist1.id()})
    client.save()
    visit('/clients')
    click_link('Jose Aldo')
    click_button('Delete Client')
    expect(page).to have_content("Your Clients")
  end
end
