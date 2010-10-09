require 'rubygems'
require 'dm-core'
require 'dm-migrations'

configure do
  DataMapper.setup(:default, ENV['DATABASE_URL'] || 'sqlite3://' + Dir.pwd + '/development.db') 
end

require 'models'

DataMapper.finalize
DataMapper.auto_upgrade!
