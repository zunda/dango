source 'https://rubygems.org'
ruby file: '.ruby-version'

gem 'sinatra'
gem 'thin'
gem 'rack-timeout'
gem 'mail', git: 'https://github.com/Shopify/mail.git', branch: 'net-smtp-dependency'

group :development, :test do
	gem 'rails_best_practices'
end

group :test do
	gem "capybara"
end
