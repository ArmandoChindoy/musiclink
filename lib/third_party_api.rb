class ThirdPartyApi
  include HTTParty

  base_uri 'https://api.spotify.com/v1/me'

  def initialize(api_key)
    @options = {
      headers: {
        'Authorization' => "Bearer #{api_key}",
        'Content-Type' => 'application/json'
      }
    }
  end

  def get_data
    self.class.get('/endpoint', @options)
  end

  def post_data(data)
    self.class.post('/endpoint', @options.merge(body: data.to_json))
  end

  def put_data(data)
    self.class.put("/player/play", @options.merge(body: data.to_json))
  end

  def delete_data(id)
    self.class.delete("/endpoint/#{id}", @options)
  end

  # Manejo de errores comunes
  def handle_response(response)
    puts response
    if response.success?
      return response.parsed_response
    else
      raise StandardError, "Error en la solicitud: #{response.code}, #{response.body}"
    end
  end
end