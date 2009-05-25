require 'rubygems'
require 'rsimpy'

# The Links class hides the internals and allows for simple posting.

links = RSimpy::Links.new 'USERNAME', 'PASSWORD'  #username and password are optional if you have stored them

response = links.save do
  title "This is my title"
  href "http://www.example.com"
  tags "one, two, three"
  url_nickname "Example"
  note "This is a fine example of an example"
end