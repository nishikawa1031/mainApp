# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2,
           ENV.fetch('GOOGLE_CLIENT_ID', 'xxxxxx'), # CI用にdefault値を設定
           ENV.fetch('GOOGLE_CLIENT_SECRET', 'xxxxxx')
end
