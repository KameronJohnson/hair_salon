Kameron's Hair Salon
================

by Kameron Johnson

Kameron's Hair Salon is a website that uses a database and Sinatra to allow users to view the stylists at Kameron's Hair Salon and their associated clients.

Installation
------------

Install Train System by first cloning the repository.  
```
$ git clone http://github.com/kameronjohnson/hair_salon.git
```

Install all of the required gems:
```
$ bundle install
```

Start the database:
```
$ postgres
```

Create the databases and tables:
```
# psql
username=# CREATE DATABASE hair_salon;
username=# \c hair_salon;
hair_salon=# CREATE TABLE clients (id serial PRIMARY KEY, client_name varchar, client_id int);
hair_salon=# CREATE TABLE stylists (id serial PRIMARY KEY, stylist_name varchar, stylist_id int);
hair_salon=# CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;
```

Start the webserver:
```
$ ruby app.rb
```

In your web browser, go to http://localhost:4567

License
-------

GNU GPL v2. Copyright 2015 Kameron Johnson
