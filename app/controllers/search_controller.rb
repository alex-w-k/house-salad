class SearchController < ApplicationController
  def index
    conn = Faraday.new('https://api.propublica.org') 
    rep_response = conn.get do |req|
      req.url "/congress/v1/members/house/#{params[:state]}/current.json"
      req.headers['X-API-Key'] = "#{ENV["PROPUBLICA_API_KEY"]}"
    end
    results = JSON.parse(rep_response.body)["results"]
    @reps = results.map do |rep|
      Representitive.new(rep)
    end
    (@reps.sort_by! &:seniority).reverse!
  end
end
