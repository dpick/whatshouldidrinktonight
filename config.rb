require 'rubygems'
require 'dm-core'
require 'dm-migrations'

configure :development do
  DataMapper.setup(:default, ENV['DATABASE_URL'] || 'sqlite3://db/development.db') 
end

require 'models'

DataMapper.finalize
DataMapper.auto_upgrade!
