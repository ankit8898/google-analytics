$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = 'google-analytics'
  s.version     = '0.0.1'
  s.date        = '2014-02-20'
  s.summary     = "Easily Fetch Your Google Analytics Data. "
  s.description = "Ruby Wrapper specific to Google Analytics on top of Google::APIClient"
  s.authors     = ["Ankit gupta"]
  s.email       = ['ankit.gupta8898@gmail.com']
  s.files       = [
                    "lib/google_analytics/base.rb",
                    "lib/google_analytics/connection.rb",
                    "lib/google_analytics/reader.rb"]
  s.require_paths = ["lib"]
  s.add_runtime_dependency 'google-api-ruby-client'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rake'
  s.license = 'MIT'
  s.homepage    =
    'https://github.com/ankit8898/google-analytics'
end