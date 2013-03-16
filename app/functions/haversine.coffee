haversine = (->
  
  # convert to radians
  toRad = (num) ->
    num * Math.PI / 180

  haversine = (start, end, options) ->
    miles = 3960
    km = 6371
    options = options or {}
    R = (if options.unit is "km" then km else miles)
    dLat = toRad(end.latitude - start.latitude)
    dLon = toRad(end.longitude - start.longitude)
    lat1 = toRad(start.latitude)
    lat2 = toRad(end.latitude)
    a = Math.sin(dLat / 2) * Math.sin(dLat / 2) + Math.sin(dLon / 2) * Math.sin(dLon / 2) * Math.cos(lat1) * Math.cos(lat2)
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))
    if options.threshold
      options.threshold > (R * c)
    else
      R * c
)()
module.exports = haversine