# _Hair Salon_

#### DATA BASICS Independent Project
Ruby: Sinatra app with Rspec and Capybara for Epicodus 07.16.2016
## By Sebastian Prokuski

***

## Description
This app allows a user to add stylists and clients to a database, and subsequently edit and remove them from said database. The app associates stylists with clients in a one to many relationship and provides various ways of displaying the information from the database.

## User Stories
* As a salon owner, I want to view, add, update and delete stylists.
* As a salon owner, I want to view, add, update and delete clients.
* As a salon owner, I want to add clients to a stylist.

## Setup
1. Clone this repository
* For a mac, run PSQL in your terminal, then enter the following:
  1. CREATE DATABASE hair_salon;
  * CREATE TABLE clients (id serial PRIMARY KEY, first_name varchar, last_name varchar, phone_num varchar, typical_package varchar, stylist_id int);
  * CREATE TABLE stylists (id serial PRIMARY KEY, first_name varchar, last_name varchar, phone_num varchar);
  * CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;
* Open a simple HTTP server in the top level of the cloned directory. For a mac, tun the following command in your terminal:
  * ruby app.rb
* Then open your web browser of choice to localhost:4567

## Database Specs
* Production Database: hair_salon
* Development Database: hair_salon_test
* Resource Names: clients, stylists
* Attributes (clients): id, first_name, last_name, phone_num, typical_package, stylist_id
* Attributes (stylists): id, first_name, last_name, phone_num

## Technologies
* Ruby
* Sinatra
* Rspec
* Capybara
* HTML
* Bootstrap

## Legal
Copyright (c) 2016 **_{Sebastian Prokuski}_**
