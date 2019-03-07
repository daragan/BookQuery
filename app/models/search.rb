class Search
  attr_reader :results
  def initialize(query)
    @results = HTTParty.get(http://openlibrary.org/api/search?q=, query: {keyword: query})
  end
end 
