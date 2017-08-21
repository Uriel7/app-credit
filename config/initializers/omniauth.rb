Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
  scope: 'user_birthday, public_profile',
  info_fields: 'name, first_name, last_name, gender, birthday'
end