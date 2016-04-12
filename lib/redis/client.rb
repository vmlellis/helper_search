module Redis
  class Client
    include Singleton

    def initialize
      @client = Redis.new(:host => "redis", :port => 6380, :db => 1)
    end

    def get
      @client
    end
  end
end
