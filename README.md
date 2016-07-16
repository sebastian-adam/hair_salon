As a salon owner, I want to view, add, update and delete stylists.
As a salon owner, I want to view, add, update and delete clients.
As a salon owner, I want to add clients to a stylist.


Production Database: hair_salon
Development Database: hair_salon_test
Resource Names: clients, stylists, stylist_shifts
Attributes (clients): id, first_name, last_name, phone_num, typical_package, stylist_id
Attributes (stylists): id, first_name, last_name, phone_num

In PSQL:
CREATE DATABASE hair_salon;
CREATE TABLE clients (id serial PRIMARY KEY, first_name varchar, last_name varchar, phone_num varchar, typical_package varchar, stylist_id int);
CREATE TABLE stylists (id serial PRIMARY KEY, first_name varchar, last_name varchar, phone_num varchar);
CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;

Your code will be reviewed for the following objectives:
Use of standard naming conventions for database tables and columns.
Correct set up of a one-to-many relationship.
Execution of CRUD functionality in class methods and routes.
Use of RESTful routes.
All previous code standards met. (Except you are not required to deploy to Heroku this week.)
Discuss the flow of your code and the concepts behind it with an instructor using correct terminology.
