#! /usr/bin/env ruby

  require 'optparse'
  require 'optparse/time'
  require 'ostruct'
  require 'pp'
  require 'rsimpy'

  class Simp


    #
    # Return a structure describing the options.
    #
    def self.parse(args)
      # The options specified on the command line will be collected in *options*.
      # We set default values here.
      options = OpenStruct.new
      options.tags = []
      options.url = ""
      options.title = ""

      opts = OptionParser.new do |opts|
        opts.banner = "Usage: example.rb [options]"

        opts.separator ""
        opts.separator "Specific options:"

        # Mandatory argument.
        opts.on("-l", "--link URL",
                "The url to save") do |url|
          options.url << url
        end

        # Mandatory argument.
        opts.on("-n", "--name NAME",
                "The url to save") do |title|
          options.title << title
        end

        # List of arguments.
        opts.on("-t", "--tags foo,bar,baz", Array, "Tags") do |tags|
          options.tags = tags
        end

      end

      opts.parse!(args)
      options
    end  # parse()

  end 

  options = Simp.parse(ARGV)

  begin
    require 'rsimpy'

    f = RSimpy::Facade.new
    f.post options.url, options.title, options.tags
  rescue
    pp options
  end
