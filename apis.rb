require "http"

system = "clear"

response = HTTPS.get(https://date.nager.at/api/v2/PublicHolidays/2022/AT)

holidays = response.parse(:json)

p holidays
