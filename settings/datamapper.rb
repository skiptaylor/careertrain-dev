configure :development do
	DataMapper::Logger.new $stdout, :debug
	# DataMapper.setup :default, 'sqlite::memory:'
	# DataMapper.setup :default, "sqlite://#{Dir.pwd}/data/development.sqlite3"
	# DataMapper.setup :default, 'mysql://username:password@host_url:3306/database_name'
	DataMapper.setup :default, 'postgres://localhost:5432/ecareertrain-db'
end

configure :production do
	# DataMapper::Logger.new $stdout, :debug
	# DataMapper.setup :default, 'sqlite::memory:'
	# DataMapper.setup :default, "sqlite://#{Dir.pwd}/data/production.sqlite3"
	# DataMapper.setup :default, 'mysql://username:password@host_url:3306/database_name'
	# DataMapper.setup :default, 'postgres://username:password@host_url:5432/database_name'
	DataMapper.setup(:default, ENV['postgresql-horizontal-93067'] || 'postgres://localhost/mydb')
end
