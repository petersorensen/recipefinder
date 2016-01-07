require 'httparty'

class Recipe
  include HTTParty

  default_params key:  ENV["FOOD2FORK_KEY"]
  #@key_value =  "9e91149b1e63214775e9a22c920e94ba"
  hostport = ENV["FOOD2FORK_SERVER_AND_PORT"] ||"www.food2fork.com/api"
  base_uri "http://#{hostport}"
  format :json

  def self.for (keyword)
    get("/search", query: {q: keyword})["recipes"]
  end
end