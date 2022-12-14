require 'active_support/core_ext/integer/time'

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded any time
  # it changes. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Store uploaded files on the local file system (see config/storage.yml for options).
  if !(ENV['CLOUDINARY_CLOUD_NAME'] || ENV['CLOUDINARY_API_KEY'] || ENV['CLOUDINARY_API_SECRET'])
    config.active_storage.service = :local
  else
    Rails.application.env_config['CLOUDINARY_CLOUD_NAME'] = ENV['CLOUDINARY_CLOUD_NAME']
    Rails.application.env_config['CLOUDINARY_API_KEY'] = ENV['CLOUDINARY_API_KEY']
    Rails.application.env_config['CLOUDINARY_API_SECRET'] = ENV['CLOUDINARY_API_SECRET']
    config.active_storage.service = :cloudinary
  end

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise exceptions for disallowed deprecations.
  config.active_support.disallowed_deprecation = :raise

  # Tell Active Support which deprecation messages to disallow.
  config.active_support.disallowed_deprecation_warnings = []

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations.
  # config.i18n.raise_on_missing_translations = true

  # Annotate rendered view with file names.
  # config.action_view.annotate_rendered_view_with_filenames = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  # Uncomment if you wish to allow Action Cable access from any origin.
  # config.action_cable.disable_request_forgery_protection = true
end

# This setups Oauth to NOT use the live google server if selected
# IF not set a user will need to specify a GOOGLE_OAUTH_CLIENT_ID and GOOGLE_OAUTH_CLIENT_SECRET they wish to route to
if !(ENV.has_key?("GOOGLE_OAUTH_CLIENT_ID") || ENV.has_key?("GOOGLE_OAUTH_CLIENT_SECRET"))
  #This enables test mode which auto redirect to the auth/google/callback. Meaning, no call is made to actual google authentication server
  OmniAuth.config.test_mode = true

  # This specifies the mock account that will be logging in. Change email to change which account is logging in when clicking 'Sign In'
  OmniAuth.config.add_mock(:google_oauth2, { info: { email: 'davidking@tamu.edu'} })

  #This configures auth and devise to work together
  Rails.application.env_config['devise.mapping'] = Devise.mappings[:person] # If using Devise
  Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
elsif
  Rails.application.env_config['GOOGLE_OAUTH_CLIENT_ID'] = ENV['GOOGLE_OAUTH_CLIENT_ID']
  Rails.application.env_config['GOOGLE_OAUTH_CLIENT_SECRET'] = ENV['GOOGLE_OAUTH_CLIENT_SECRET']
end

