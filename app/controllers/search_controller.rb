class SearchController < ApplicationController

  get '/' do
    api_result = RestClient.get
  end
end
