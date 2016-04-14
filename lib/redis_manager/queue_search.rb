module RedisManager
  # Redis Queue to search
  class QueueSearch
    include Singleton

    SET_REFERENCE = 'ips:reference'.freeze

    def initialize
      client = Client.instance
      @redis = client.redis
    end

    def enqueue(ip, text)
      id = current_id

      @redis.pipelined do
        @redis.rpush(ip, text)
        @redis.sadd(id, ip)
      end
    end

    def dequeue
      ips = dequeue_ips

      ips.each_with_object({}) do |ip, hsh|
        searchs = dequeue_searchs(ip)
        hsh[ip] = searchs if searchs.present?
      end
    end

    private

    def dequeue_ips
      id = current_id
      change_set_id

      ips = []
      while ip = @redis.spop(id)
        ips << ip
      end
      ips
    end

    def dequeue_searchs(ip)
      searchs = Set.new
      while search = @redis.lpop(ip)
        searchs << search
      end
      searchs.to_a
    end

    def current_id
      @set_id ||= @redis.get(SET_REFERENCE)
      change_set_id if @set_id.nil?
      @set_id
    end

    def change_set_id
      @set_id = SecureRandom.uuid
      @redis.set(SET_REFERENCE, @set_id)
    end
  end
end
