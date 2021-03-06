class HolidayService < ApiService
	def self.holidays
		endpoint = 'https://date.nager.at/Api/v2/NextPublicHolidays/us'
		parsed = get_data(endpoint)[0..2]

		parsed.map do |holiday|
			Holiday.new(holiday)
		end
	end
end