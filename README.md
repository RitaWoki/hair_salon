# _Hair Salon_

#### By **Rita Woki**

## Objectives
Hair Salon
Create an application for a hair salon. The stylists at the salon work independently, so each client will only belong to a single stylist (one stylist, many clients).

The following user stories should be completed:

As a salon owner, I want to view, add, update and delete stylists.
As a salon owner, I want to view, add, update and delete clients.
As a salon owner, I want to add clients to a stylist.
Additional Requirements
For this code review, please use the following names for your databases:

Production Database: hair_salon
Development Database: hair_salon_test
Resource names will be clients and stylists

In your README, include database setup instructions with your database names and tables for (see example for 'To Do' application below):

In PSQL:

CREATE DATABASE hair_salon;
CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);
CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);

## Specifications
See spec folder

## Technologies Used
* Markdown
* HTML
* Ruby
* Sinatra
* Pry
* CSS
* Bootstrap
* capybara


## Setup/Installation Requirements

#### Option #1
* Clone this repository
* Open using Sinatra
