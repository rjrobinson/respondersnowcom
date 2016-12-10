Raven.configure do |config|
  config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)

  config.dsn = 'https://44cc4738c98e441684ccc0e5618102f9:861bb16e354e4865a771fd97be841ddf@sentry.io/121246'
  config.environments = ['production', 'development']
end