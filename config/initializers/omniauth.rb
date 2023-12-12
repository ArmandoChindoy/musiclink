Rails.application.config.middleware.use OmniAuth::Builder do
    provider :spotify, 'a4b6995a3bdc42f7a1f98b1d5417f98f', 'a3c97060620742f1b49ddc25e3e17b4b',
             scope: 'user-library-read user-read-email user-read-private playlist-read-private playlist-modify-public playlist-modify-private user-top-read user-follow-modify user-read-playback-state user-modify-playback-state user-read-currently-playing user-read-recently-played user-library-modify user-read-playback-position playlist-modify-private',
             redirect_uri: 'http://127.0.0.1:3000/auth/spotify/callback',
             callback_path: '/auth/spotify/callback'
  end
  