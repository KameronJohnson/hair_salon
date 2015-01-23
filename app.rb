require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/client")
require("./lib/stylist")
require("pg")

DB = PG.connect({:dbname => "hair_salon"})

get("/") do
  @stylists = Stylist.all()
  erb(:index)
end

post("/stylists") do
  stylist_name = params.fetch("stylist_name")
  stylist = Stylist.new({:stylist_name => stylist_name, :stylist_id => nil})
  stylist.save()
  @stylists = Stylist.all()
  erb(:index)
end

get("/stylists/:stylist_id") do
  @stylist = Stylist.find_stylist(params.fetch("stylist_id").to_i())
  erb(:stylist)
end

post("/clients") do
  client_name = params.fetch("client_name")
  client_id = params.fetch("client_id").to_i()
  client = Client.new({:client_name => client_name, :client_id => client_id})
  client.save()
  @stylist = Stylist.find_stylist(client_id)
  erb(:stylist)
end
