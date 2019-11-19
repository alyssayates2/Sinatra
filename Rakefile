require_relative './config/environment'
require 'sinatra/activerecord/rake'

def reload!
  load_all "./config" if Dir.exists?("./config")
  load_all "./app" if Dir.exists?("./app")
  load_all "./lib" if Dir.exists?("./lib")
  load_all "./*.rb" if Dir.exists?("./*.rb")
end

task :console do
  puts "Loading your application environment..."
  reload!
  puts "Console started."
  Pry.start
end
