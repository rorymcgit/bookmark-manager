# Bookmark Manager

A website which allows a user to create an account for storing URLs of favourite sites with tags. This was written over the course of my fourth week at Makers Academy.


#### Instructions for use:
- Clone this repo
- Run ```bundle``` to install dependencies
- Run ```rspec``` to view tests
- If you don't already have PostgreSQL ```brew install postgresql```
- To create databases:
```
$ createdb bookmark_manager_development
$ createdb bookmark_manager_test
```
- Run ```rackup``` to auto-upgrade and start server
- In your browser, visit http://localhost:9292/

#### Technologies used:
- Ruby
- RSpec
- Sinatra
- DataMapper (a Ruby ORM)
- BCrypt (for password hashing)
- PostgreSQL (a relational DBMS)


## User stories
```
As a web surfer,
So that I can visit interesting pages,
I want to see a list of links.

As a web surfer,
So that I can save an interesting page,
I would like to add to the list of links.

As a web surfer,
So that I can keep links organised,
I want to be able to tag my links.
```
