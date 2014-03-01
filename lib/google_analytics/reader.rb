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
			{visits: visits,
			 unique_visitors: unique_visitors,
			 bounce_rate: bounce_rate,
			 page_views: page_views,
			 avg_visit_duration: avg_visit_duration,
			 pages_per_visit: pages_per_visit,
			 percent_new_visits: percent_new_visits}
		end


		def visits
			fetcher('ga:visits').data.totalsForAllResults.send('ga:visits')
		end

		def unique_visitors
			fetcher('ga:visitors').data.totalsForAllResults.send('ga:visitors')
		end

		def bounce_rate
			fetcher('ga:visitBounceRate').data.totalsForAllResults.send('ga:visitBounceRate').to_f.round(2)
		end

		def page_views
			fetcher('ga:pageviews').data.totalsForAllResults.send('ga:pageviews')
		end

		def avg_visit_duration
			fetcher('ga:avgTimeOnSite').data.totalsForAllResults.send('ga:avgTimeOnSite').to_f.round(2)
		end

		def pages_per_visit
		   fetcher('ga:pageviewsPerVisit').data.totalsForAllResults.send('ga:pageviewsPerVisit').to_f.round(2)
		end

		def percent_new_visits
		   fetcher('ga:percentNewVisits').data.totalsForAllResults.send('ga:percentNewVisits').to_f.round(2)
		end

		def fetcher(metric)
			@client.execute(:api_method => @api[:analytics].data.ga.get, :parameters => { 
				'ids' => "ga:" + @@profileID, 
				'start-date' => @start_date,
				'end-date' => @end_date,
				'metrics' => metric
				})
		end
	end
end
