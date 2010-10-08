require 'rubygems'
require 'dm-core'
require 'dm-migrations'

configure :development do
  DataMapper.setup(:default, ENV['DATABASE_URL'] || 'sqlite3://' + Dir.pwd + 'development.db') 
end

DataMapper.finalize
DataMapper.auto_upgrade!

require 'models'

DataMapper.finalize
DataMapper.auto_upgrade!
