require 'erb'
require 'dotenv'

# Create docker-compose.yml from erb template
Dotenv.load! File.join(File.dirname(__FILE__), ".env")
erb = File.open(File.join(File.dirname(__FILE__), "docker-compose.yml.erb")) { |f| ERB.new(f.read) }
File.write(File.join(File.dirname(__FILE__), "docker-compose.yml"), erb.result(binding))
