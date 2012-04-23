Shieldformen::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send
  config.action_mailer.raise_delivery_errors = true

  # Alternate configuration example, using gmail:
  config.action_mailer.delivery_method = :test
  #config.action_mailer.smtp_settings = {
    #address:        "temp.shieldformen.com",
    #port:           993, 
    #domain:         "shieldformen.com",
    #authentication: "plain",
    #user_name:      "info@shieldformen.com",
    #password:       "Exc3ll3nc3",
    #enable_starttls_auto: true
  #} 

  # Print deprecation notices to the Rails logger
  config.active_support.deprecation = :log

  # Only use best-standards-support built into browsers
  config.action_dispatch.best_standards_support = :builtin

  # Raise exception on mass assignment protection for Active Record models
  config.active_record.mass_assignment_sanitizer = :strict

  # Log the query plan for queries taking more than this (works
  # with SQLite, MySQL, and PostgreSQL)
  config.active_record.auto_explain_threshold_in_seconds = 0.5

  # Do not compress assets
  config.assets.compress = false

  # Expands the lines which load the assets
  config.assets.debug = true
  

  # Makes sure ActiveMerchant runs in test mode in development
  config.after_initialize do 
    ActiveMerchant::Billing::Base.mode = :test
    ::GATEWAY = ActiveMerchant::Billing::AuthorizeNetGateway.new(
      :login => "65LhZ6uh",
      :password => "7Jbp6Me549j8z2MG"
    )
  end
end
