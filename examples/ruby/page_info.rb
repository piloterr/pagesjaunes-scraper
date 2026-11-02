# PagesJaunes Page Info API – Ruby example (stdlib only)
# Usage: PILOTERR_API_KEY=your-key ruby page_info.rb
require "json"
require "net/http"
require "uri"

uri = URI("https://api.piloterr.com/v2/pagesjaunes/page/info")
uri.query = URI.encode_www_form('query' => 'https://www.pagesjaunes.fr/pros/56824689')

request = Net::HTTP::Get.new(uri)
request["x-api-key"] = ENV.fetch("PILOTERR_API_KEY")

response = Net::HTTP.start(uri.host, uri.port, use_ssl: true, read_timeout: 120) do |http|
  http.request(request)
end

abort "Piloterr error #{response.code}: #{response.body}" unless response.is_a?(Net::HTTPSuccess)

puts JSON.pretty_generate(JSON.parse(response.body))
