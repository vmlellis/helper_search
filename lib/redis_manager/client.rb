module RedisManager
  # Redis Client
  class Client
    include Singleton

    def initialize
      @redis = Redis.new(host: 'redis', port: 6379, db: 1)
    end

    attr_reader :redis
  end
end
