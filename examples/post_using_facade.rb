require 'rubygems'
require 'rsimpy'

# The Facade class hides the internals and allows for simple posting.

f = RSimpy::Facade.new          #add optional username and password parameters here if you don't have them saved
f.post 'http://www.example.com', 'Example', 'silly,example,cheese'  #url, title, tags (comma separated)
