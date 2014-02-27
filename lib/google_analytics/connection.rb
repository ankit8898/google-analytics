module GoogleAnalytics
	class Connection < Base

		def connect
			key = Google::APIClient::KeyUtils.load_from_pkcs12(@@key_file, @@key_secret)
			self.authorization = Signet::OAuth2::Client.new(
				:token_credential_uri => 'https://accounts.google.com/o/oauth2/token',
				:audience => 'https://accounts.google.com/o/oauth2/token',
				:scope => 'https://www.googleapis.com/auth/analytics.readonly',
				:issuer => @@service_account_email,
				:signing_key => key)

			self.authorization.fetch_access_token!
			self
		end


	end
end

