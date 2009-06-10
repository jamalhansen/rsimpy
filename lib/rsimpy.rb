begin
  require 'httparty'
rescue LoadError
  require 'rubygems'
  require 'httparty'
end


$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'client'
require 'user'          
require 'parameters'  
require 'configuration'
require 'profile_storage_service'
require 'posting_service'
require 'querying_service'
require 'links'
require 'responsive'

module RSimpy
  
end                      


