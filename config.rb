require 'dm-core'
require 'dm-migrations'

configure :development do
  #DataMapper.setup(:default, 'sqlite://' + Dir.pwd + '/development.db')
  DataMapper.setup(:default, ENV['DATABASE_URL'] || 'sqlite3://development.db') 
end

require 'models'

DataMapper.finalize
DataMapper.auto_upgrade!
