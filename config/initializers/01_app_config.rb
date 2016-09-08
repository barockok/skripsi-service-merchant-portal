cfile = File.expand_path('../../app.yml', __FILE__)
config = YAML.load(ERB.new(IO.read(cfile)).result).with_indifferent_access
APP_CONFIG = config[Rails.env]
