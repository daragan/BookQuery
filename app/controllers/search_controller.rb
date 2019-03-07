class SearchController < ApplicationController

   def show
     if params[:query]
       @search = Search.new(params[:query])
     end
   end

end
