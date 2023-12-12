class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :spotify_login
  def index
  end  
  
  def spotify_callback
      # Procesa la respuesta de Spotify y maneja la autenticación aquí
    end
  
    def failure
      # Maneja el caso en el que la autenticación falla
    end
  
    def destroy
      # Implementa la lógica para cerrar sesión
    end

    def spotify_login
      # byebug
      query_params = {
        client_id: 'a4b6995a3bdc42f7a1f98b1d5417f98f',
        response_type: "code",
        redirect_uri: 'http://127.0.0.1:3000/auth/spotify/callback',
        scope: 'user-read-email playlist-modify-public user-library-read   user-library-modify',
        show_dialog: true
      }
      redirect_to "https://accounts.spotify.com/authorize?#{query_params.to_query}", allow_other_host: true
    end
  end
  