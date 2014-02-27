module GoogleAnalytics 
	class Base < Google::APIClient

		@@api_version = 'v3'
		@@cached_api_file = File.join("#{Rails.root}/config/key","analytics-#{@@api_version}.cache")
		@@service_account_email = '723314723214@developer.gserviceaccount.com' # Email of service account
		@@key_file = File.join("#{Rails.root}/config/key","a509343c20a8486ae39593772f6631a4ca12da0a-privatekey.p12") # File containing your private key
		@@key_secret = 'notasecret'
		@@profileID = '51025693'

		def initialize
		  super(:application_name => 'Google Analytics Aggregator', :application_version => '1.0.0')
		end

		def load_discover_api
		    analytics = discovered_api('analytics', @@api_version)
			File.open(@@cached_api_file, 'w') do |file|
				Marshal.dump(analytics, file)
			end
		   {analytics: analytics}
		end
	end
end