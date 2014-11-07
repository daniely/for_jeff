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

task :scrap => :dotenv do
  # You can obtain you access id and secret key here: http://moz.com/products/api/keys
  ACCESS_ID = ENV['ACCESS_ID']
  SECRET_KEY = ENV['SECRET_KEY']

  # TODO: grab terms from database
  term = URI::encode("insurance binder")

  urls = Scraper.scrape(term)
  # for testing
  #urls = Scraper::SAMPLE_URLS

  metrics = Moz.metrics(ACCESS_ID, SECRET_KEY, urls)

  puts metrics
  # TODO: put metrics into db
end
