module RedisManager
  # Redis Queue
  class Queue
    include Singleton

    KEY = 'ip'.freeze
    PROCESSING_KEY = 'ip:processing'.freeze
    PROCESSED_KEY = 'ip:processed'.freeze

    def initialize
      client = Client.instance
      @redis = client.redis
    end

    def enqueue_search(ip, text)
      # TODO: enqueue search by IP

      # TODO: queue search in IP list
      @redis.lpush(ip, text)

    end

    def dequeue_ips
      # TODO: Dequeue ips
    end

    def dequeue_searchs(ip)
      # Dequeue searchs by IP
    end
  end
end
