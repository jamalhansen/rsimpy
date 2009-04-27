require 'rubygems'
require 'rsimpy'  

client = RSimpy::Client.new(RSimpy::User.new('USERNAME', 'PASSWORD'))
params = RSimpy::Parameters.new :href => "http://www.hanselminutes.com", :title => "Hanselminutes", :tags => 'alt.net,podcast'                                                                                  
service = RSimpy::LinkPostingService.new(client)
service.post params
