Spokenvote::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # Code is not reloaded between requests
  config.cache_classes = true

  config.eager_load = true

  # Enable threaded mode
  #config.threadsafe!

  ActionMailer::Base.smtp_settings = {
      :address        => ENV['MAIL_ADDRESS'],
      :port           => ENV['MAIL_PORT'],
      :domain         => ENV['MAIL_DOMAIN'],
      :user_name =>      ENV['MANDRILL_USERNAME'],
      :password =>       ENV['MANDRILL_APIKEY'],
      :authentication => :plain,
      :enable_starttls_auto => true
  }

  Premailer::Rails.config.merge!(base_url: 'http://staging.spokenvote.org/')

  # Full error reports are disabled and caching is turned on
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Disable Rails's static asset server (Apache or nginx will already do this)
  config.serve_static_files = true # Make it true for heroku

  # Compress JavaScripts and CSS
  # Suggested by Bates in Rails 4 Upgrade
  #config.assets.compress = true
  config.assets.js_compressor = Uglifier.new(mangle: true)

  # For Angularjs     set "mangle: true" to get maximum js compression  (old Bates advice, but not widely accepted.)
  #config.assets.js_compressor = Sprockets::LazyCompressor.new { Uglifier.new(mangle: false) }

  # Don't fallback to assets pipeline if a precompiled asset is missed
  config.assets.compile = true

  # Generate digests for assets URLs
  config.assets.digest = true

  # Defaults to nil and saved in location specified by config.assets.prefix
  # config.assets.manifest = YOUR_PATH

  # Specifies the header that your server uses for sending files
  # config.action_dispatch.x_sendfile_header = "X-Sendfile" # for apache
  # config.action_dispatch.x_sendfile_header = 'X-Accel-Redirect' # for nginx

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  # config.force_ssl = true

  # See everything in the log (default is :info)
  # config.log_level = :debug

  # Prepend all log lines with the following tags
  # config.log_tags = [ :subdomain, :uuid ]

  # Use a different logger for distributed setups
  # config.logger = ActiveSupport::TaggedLogging.new(SyslogLogger.new)

  # Use a different cache store in production
  # config.cache_store = :mem_cache_store
  config.cache_store = :dalli_store

  # Enable serving of images, stylesheets, and JavaScripts from an asset server
  # config.action_controller.asset_host = "http://assets.example.com"

  # Precompile additional assets (application.js, application.css, and all non-JS/CSS are already added)
  config.assets.precompile += ['active_admin.js', 'active_admin.css', 'active_admin/print.css']

  # Disable delivery errors, bad email addresses will be ignored
  # config.action_mailer.raise_delivery_errors = false

  config.action_mailer.default_url_options = { :host => 'staging.spokenvote.org' }

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation can not be found)
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners
  config.active_support.deprecation = :notify

  # Log the query plan for queries taking more than this (works
  # with SQLite, MySQL, and PostgreSQL)
  # config.active_record.auto_explain_threshold_in_seconds = 0.5

  config.assets.initialize_on_precompile = false # To fix https://github.com/Compass/compass-rails/issues/19 https://github.com/spree/spree_fancy/issues/2
end
