require 'erb'
require 'dotenv'

# Create docker-compose.yml from erb template
DOT_ENV = File.join(File.dirname(__FILE__), ".env")
if File.exist?(DOT_ENV)
  Dotenv.load! DOT_ENV
  erb = File.open(File.join(File.dirname(__FILE__), "docker-compose.yml.erb")) { |f| ERB.new(f.read) }
  File.write(File.join(File.dirname(__FILE__), "docker-compose.yml"), erb.result(binding))
end
