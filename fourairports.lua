--KDTW 42.23,-83.33 42.21242 -83.35339
--KMTC 42.62,-82.82 42.61389 -82.83691
--KPHN 42.92,-82.52
--KFNT 42.97,-83.75

local a = {}
local b = {}
a.lat = 42.21242
a.lon = -83.35339
b.lat = 42.61389
b.lon = -82.83691


--d = acos(cosd(90-Lat(1:end-1)) .* cosd(90-Lat(2:end)) + sind(90-Lat(1:end-1)) .* sind(90-Lat(2:end))) .* cosd(Lon(1:end-1)-Lon(2:end)) * 3958.76;

first = math.acos(math.rad(90-(a.lat-1)))
print(first) --*

second = math.cos(math.rad(90-b.lat)) 
print(second) --+

third = math.sin(math.rad(90-(a.lat-1)))
print(third) --*

fourth = math.sin(math.rad(90-b.lat))
print(fourth) --*

fifth = math.cos(math.rad(a.lon-b.lon))
print(fifth)

firstprod = first * second
print("firstprod = " .. firstprod)
secondprod = third * fourth * fifth * 3958.76
print("secondprod= " .. secondprod)

total = firstprod + secondprod
print("total = " .. total)


--[[
-- * 3958.76

The distance is between the two gps coordinates is 
61.57 KM or 
38.26 Miles or 
33.24 Nautical miles or 
61568.12 meters

https://gps-coordinates.org/distance-between-coordinates.php

https://stackoverflow.com/questions/27928/calculate-distance-between-two-latitude-longitude-points-haversine-formula
--]]
