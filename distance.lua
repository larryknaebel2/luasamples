function getDistanceFromLatLonInKm(lat1,lon1,lat2,lon2) 
  local R = 6371 -- Radius of the earth in km
  local dLat = math.rad(lat2-lat1)  -- deg2rad below
  local dLon = math.rad(lon2-lon1) 
  local a = 
    math.sin(dLat/2) * math.sin(dLat/2) +
    math.cos(math.rad(lat1)) * math.cos(math.rad(lat2)) * 
    math.sin(dLon/2) * math.sin(dLon/2)
     
  local c = 2 * math.atan2(math.sqrt(a), math.sqrt(1-a)) 
  local d = R * c -- Distance in km
  return d
end

function deg2rad(deg)
  return deg * (math.pi/180)
end

print(getDistanceFromLatLonInKm(42.21242, -83.35339,2.61389, -82.83691))