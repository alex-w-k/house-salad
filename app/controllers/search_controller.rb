class SearchController < ApplicationController
  def index
    conn = Faraday.new('https://api.propublica.org') 
    conn.get do |req|
      req.url "/congress/v1/members/house/#{params[:state]}/current.json"
      req.headers['X-API-Key'] = "#{ENV["PROPUBLICA_API_KEY"]}"
    end
  end
end
