class Moz
  attr_reader :access_id, :secret_key, :urls

  def initialize(access_id, secret_key, urls)
    @access_id = access_id
    @secret_key = secret_key
    @urls = urls
  end

  def self.metrics(access_id, secret_key, urls)
    self.new(access_id, secret_key, urls).metrics
  end

  def metrics
    # Set your expires for several minutes into the future.
    # Values excessively far in the future will not be honored by the Mozscape API.
    expires	= Time.now.to_i + 300

    # A new linefeed is necessary between your AccessID and Expires.
    string_to_sign = "#{@access_id}\n#{expires}"

    # Get the "raw" or binary output of the hmac hash.
    binary_signature = OpenSSL::HMAC.digest('sha1', @secret_key, string_to_sign)

    # We need to base64-encode it and then url-encode that.
    url_safe_signature = CGI::escape(Base64.encode64(binary_signature).chomp)

    # Add up all the bit flags you want returned.
    # Learn more here: http://apiwiki.moz.com/query-parameters/
    # return fields: umrp, umrr, pda, upa, uu (url)
    cols = '103079231492'

    # Now put your entire request together.
    # This example uses the Mozscape URL Metrics API.
    request_url = "http://lsapi.seomoz.com/linkscape/url-metrics/?Cols=#{cols}&AccessID=#{@access_id}&Expires=#{expires}&Signature=#{url_safe_signature}"

    # Put your URLS into an array and json_encode them.
    #batched_domains = ['www.moz.com', 'www.apple.com', 'www.pizza.com']

    encoded_domains = urls.to_json

    # Go and fetch the URL
    uri = URI.parse("#{request_url}")
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri)
    request.body = encoded_domains
    response = http.request(request)

    # remove rows where url is blank before returning
    return JSON.parse(response.body).select{|item| !item['uu'].empty? }
  end
end
