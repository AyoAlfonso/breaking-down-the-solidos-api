 def self.i18n_available_locales
    I18n.available_locales.select do |locale|
      I18n.t('spree.i18n.this_file_language', locale: locale, fallback: false, default: nil)
    end
  end

=begin

You can even add a scope:
There is a en.yml that does the translation


With congfig at root of app

config/application.rb
config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]

=end 


config/application.rb
config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
