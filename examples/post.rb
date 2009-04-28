require 'rubygems'
require 'rsimpy'  

# Prepare to post
client = RSimpy::Client.new(RSimpy::User.new('USERNAME', 'PASSWORD'))
service = RSimpy::LinkPostingService.new(client)

# Setup the post parameters
params = RSimpy::Parameters.new :href => "http://www.example.com", :title => "Example Site", :tags => 'search'

# Post
service.post params
