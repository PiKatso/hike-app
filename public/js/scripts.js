function getWeather() {
		$.ajax({
			url: 'http://api.wunderground.com/api/3df9e5569912899b/geolookup/conditions/q/97214.json',
			dataType: 'jsonp',
			success: function(response) {
				var conditions = response.current_observation.weather;
				loadImage(conditions)
			}
		});
	}
