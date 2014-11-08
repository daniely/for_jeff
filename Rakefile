require 'openssl'
require 'base64'
require 'cgi'
require 'json'
require 'net/http'
require 'uri'
require 'nokogiri'
require 'open-uri'
require 'pry'
require 'dotenv'
require 'dotenv/tasks'

require './scraper'
require './moz'

Dotenv.load(ENV['CONFIG'])

task :default => :scrap

task :scrape, [:term] => :dotenv do |t, args|
  # You can obtain you access id and secret key here: http://moz.com/products/api/keys
  ACCESS_ID = ENV['ACCESS_ID']
  SECRET_KEY = ENV['SECRET_KEY']

  # TODO: grab terms from database
  terms = Array(args[:term]) + args.extras
  raise "please include term(s) when calling 'scrape' rake task" if terms.empty?

  terms.each do |term|
    urls = Scraper.scrape(term)
    # for testing
    #urls = Scraper::SAMPLE_URLS

    metrics = Moz.metrics(ACCESS_ID, SECRET_KEY, urls)

    puts metrics
    # TODO: put metrics into db
  end
end
