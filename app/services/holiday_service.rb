class HolidayService < ApiService
	def self.holidays
		endpoint = 'https://date.nager.at/Api/v2/NextPublicHolidays/us'
		parsed = get_data(endpoint)
		
	end
end