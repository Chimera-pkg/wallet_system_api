class LatestStockPrice
    BASE_URL = 'https://latest-stock-price.p.rapidapi.com'
  
    def self.price(symbol)
      get("/price/#{symbol}")
    end
  
    def self.prices(symbols)
      get("/prices/#{symbols.join(',')}")
    end
  
    def self.price_all
      get("/price_all")
    end
  
    def self.get(path)
      response = RestClient.get("#{BASE_URL}#{path}", headers: headers)
      JSON.parse(response.body)
    end
  
    def self.headers
      {
        'X-RapidAPI-Key' => 'your_api_key',
        'X-RapidAPI-Host' => 'latest-stock-price.p.rapidapi.com'
      }
    end
  end
  