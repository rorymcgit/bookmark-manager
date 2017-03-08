require 'rubygems'
require './app'
require 'data_mapper'

DataMapper.setup(:default, ENV['DATABASE_URL'] || 'postgres://localhost/mydb')

run App
