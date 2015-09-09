module Utilities
	
	def leap_year?(year)
		( div_by?(year, 100) && div_by?(year, 400) ) || ( div_by?(year, 4) && !div_by?(year, 100) ) 
	end

	def percent_of_year(seconds)
		('%.1f' % ((seconds / seconds_year) * 100)) + '%'
	end

	def seconds_year
		60 * 60 * 24 * 365
	end

	def military_time(time)
		time = time.split(" ")
		hour_min = time[0].split(":")
		 hour = hour_min[0].to_i
		 min = hour_min[1].to_i
		if time[1].downcase == "pm" && hour != 12
			hour = hour + 12
		elsif time[1].downcase == "am" && hour == 12
			hour = 0
		end
		return time = hour.to_s + ":" + min.to_s
	end

	def standard_time(time)
		hour, minute = time.split(":")
		hour = hour.to_i
		if hour < 12
			if hour == 0
				hour = 12
			end
			am_pm = "am"
		else
			hour = hour - 12
			am_pm = "pm"
		end
		return hour.to_s + ":" + minute.to_s + " " + am_pm

	end

	def okay(a, b)
		c = false
		if (a.split(":")[0].to_i >= 8 && b || a.split(":")[0].to_i >= 10 && !b) && a.split(":")[1].split(" ")[1] == 'pm'
			c = false
		else
			c = true
		end
		return c
	end

	def span(a, b)
		c = 0
		d = 0
		if a < b
			c = b
			d = a
		else
			c = a
			d = b
		end

		return ('%.1f' % (amount(c)[0..-2].to_f - amount(d)[0..-2].to_f)).to_s + '%'
	end

	# privite

		def div_by?(n, m)
			n % m == 0
		end

end