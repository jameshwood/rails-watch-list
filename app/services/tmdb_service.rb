require 'uri'
require 'net/http'
require 'json'

class TmdbService
  def self.fetch_movies
    url = URI("https://api.themoviedb.org/3/movie/popular?language=en-US&page=1")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["accept"] = 'application/json'
    request["Authorization"] = 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4YzA1MjM1MWM0MmY0NGY3YzE5NDZhYmUzOTJjNzlmMyIsIm5iZiI6MTczMjY0NTY2Ni40ODQ1MjQzLCJzdWIiOiI2NzM4Y2IxZTM1ZjFlNmQxN2QyZWFkNjIiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.0QUNUF86RAcGebiNo3v22kAFVOiovwkc1OR1z_Hfei0'

    response = http.request(request)
    json_response = JSON.parse(response.read_body)
    json_response['results']
  end

  def self.fetch_movie_details(movie_id)
    url = URI("https://api.themoviedb.org/3/movie/#{movie_id}")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["accept"] = 'application/json'
    request["Authorization"] = 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4YzA1MjM1MWM0MmY0NGY3YzE5NDZhYmUzOTJjNzlmMyIsIm5iZiI6MTczMjY0NTY2Ni40ODQ1MjQzLCJzdWIiOiI2NzM4Y2IxZTM1ZjFlNmQxN2QyZWFkNjIiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.0QUNUF86RAcGebiNo3v22kAFVOiovwkc1OR1z_Hfei0'

    response = http.request(request)
    JSON.parse(response.read_body)
  end



  # def self.search_movies(query)
  #   url = "#{BASE_URL}/search/movie?api_key=#{API_KEY}&query=#{URI.encode(query)}"
  #   response = URI.open(url).read
  #   JSON.parse(response)['results']
  # end
end
