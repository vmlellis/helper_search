#!/usr/bin/env ruby
require 'socket'

def start_selector(arg)
  case arg
  when 'jobs'
    start_jobs
  when 'server'
    start_server
  end
end

def start_server
  puts "server starting... connect via http://#{Socket.ip_address_list[1].ip_address} when ready"
  exec("puma", "-p", "3000")
end

def start_jobs
  exec('sidekiq')
end

case ARGV.count
when 0
  start_server
when 1
  start_selector(ARGV[0])
end
