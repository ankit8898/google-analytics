module GoogleAnalytics
	class Reader < Base


		def initialize
			@client = GoogleAnalytics::Connection.new
			@client.connect
			@api = @client.load_discover_api
			@start_date = DateTime.now.prev_month.strftime("%Y-%m-%d")
			@end_date = DateTime.now.strftime("%Y-%m-%d")
		end

		def total_all_results(opts = {})

			hsh = {}
			opts[:metrics] = "ga:visits,ga:visitors,ga:visitBounceRate,ga:pageviews,ga:timeOnSite"


			all = @client.execute(:api_method => @api[:analytics].data.ga.get, :parameters => { 
				'ids' => "ga:" + @@profileID, 
				'start-date' => @start_date,
				'end-date' => @end_date,
				'dimensions' => "ga:day,ga:month",
				'metrics' => opts[:metrics],
				'sort' => "ga:month,ga:day" 
				})

			opts[:metrics].split(',').each	do |metric|
				hsh[metric] = all.data.totalsForAllResults.send(metric)
			end

			hsh
		end
end
end
