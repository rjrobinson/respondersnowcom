require 'redis'

configs = YAML.load( File.open( Rails.root.join("config/redis.yml") ) )
redis = Redis.new(configs[Rails.env])
