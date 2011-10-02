# encoding: utf-8
require 'sequel'
DB = Sequel.connect( ENV['DATABASE_URL'] || 'sqlite://my.db' )
# DB = Sequel.postgres 'dbname', user:'bduser', password:'dbpass', host:'localhost'
# DB << "SET CLIENT_ENCODING TO 'UTF8';"

require_relative 'account'
require_relative 'type'
require_relative 'monster'
require_relative 'letter'
