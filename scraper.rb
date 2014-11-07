# perform a search on google and return the top N urls (defaults to 9)
# e.g.
#   Scraper.scrape('foo')    # => google search "foo", return 9 results
#   Scraper.scrape('foo', 2) # => google search "foo", return 2 results
class Scraper
  attr_reader :term, :count

  DEFAULT_COUNT = 9
  SAMPLE_URLS = [
    ["http://www.ehow.com/about_5044751_insurance-binder.html"],
    ["http://resourcepro.com/iac/documents/Certificates%20of%20Insurance,%20Binders%20and%20Evidences%20of%20Insurance%20-%20What%20is%20the%20Difference.pdf"],
    ["http://insurance.answers.com/home-insurance/understanding-insurance-what-is-an-insurance-binder"],
    ["http://www.irmi.com/online/insurance-glossary/terms/b/binder.aspx"],
    ["http://milton-canton-realestate.com/post/2128615/what-is-a-homeowner-s-insurance-binder-"],
    ["http://legal-dictionary.thefreedictionary.com/binder"],
    ["http://financial-dictionary.thefreedictionary.com/insurance+binder"],
    ["http://personalinsure.about.com/od/insurancetermsglossary/g/binder.htm"],
    ["http://www.insurancejournal.com/magazines/features/2011/09/05/213622.htm"]
  ].flatten

  def initialize(term, count=DEFAULT_COUNT)
    @term = URI::encode(term)
    @count = count
  end

  def self.scrape(term, count=DEFAULT_COUNT)
    self.new(term, count).scrape
  end

  def scrape
    page = Nokogiri::HTML(open("http://www.google.com/search?q=#{@term}"))

    # get first 9 search results (10 result is list of images)
    [*0..(@count-1)].map do |i|
      # parsing google search page to grab the href
      data = page.css('ol').children[i].css('a').first.attributes['href'].value
      # get just the url
      CGI::parse(URI(data).query)['q']
    end.flatten
  end
end
