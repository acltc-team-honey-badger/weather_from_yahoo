class WeatherController < ApplicationController

  def index
    city = params[:city] || "San Francisco"
    state = params[:state] || "California"


    weather = Unirest.get("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22#{city}%2C%20#{state}%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys").body
    @location_and_time = weather["query"]["results"]["channel"]["item"]["title"]
    @current_condition = weather["query"]["results"]["channel"]["item"]["condition"]
    @forecasts = weather["query"]["results"]["channel"]["item"]["forecast"]
    @description = weather["query"]["results"]["channel"]["item"]["description"]
  end
end
