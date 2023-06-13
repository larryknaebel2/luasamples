--[[

--KDTW 42.21242   -83.35339  42.23,-83.33
--KMTC 42.61389   -82.83691  42.62,-82.82
--KYIP 42.237812  -83.514565
--KPHN 42.9109722 -82.5288611 42.92,-82.52

-- KVLL 42.5429444,-83.1778889

https://blog.batchgeo.com/manipulating-coordinates-in-excel/
Nautical Miles= ACOS [(sin(Lat_place_1*PI()/180)*sin(Lat_place_2*PI()/180)+
cos(Lat_place_1*PI()/180)*cos(Lat_place_2*PI()/180)*
cos(Lon_place_2*PI()/180-Lon_place_1*PI()/180)) ] *3443.8985
--]]

function distanceNM(lat1,lon1,lat2,lon2)
	local dNM = math.sin(lat1 * math.pi / 180) * math.sin(lat2 * math.pi / 180) +
		math.cos(lat1 * math.pi / 180) * math.cos(lat2 * math.pi / 180) *
		math.cos(lon2 * math.pi / 180 - lon1 * math.pi / 180) 
	return math.acos(dNM) * 3443.8985 
end

function loadData()
	weatherTable[0] = {}
	weatherTable[0].icao = "KDTW"
	weatherTable[0].lat = 42.23
	weatherTable[0].lon = -83.33
	weatherTable[1] = {}
	weatherTable[1].icao = "KMTC"
	weatherTable[1].lat = 42.62
	weatherTable[1].lon = -82.82
	weatherTable[2] = {}
	weatherTable[2].icao = "KPHN"
	weatherTable[2].lat = 42.92
	weatherTable[2].lon = -82.52	
end

function currentPosition(anumber)
	if anumber == 1 then
	-- KDTW
		mypos.lat = 42.21242   
		mypos.lon = -83.35339
	elseif anumber == 2 then
	-- KMTC
		mypos.lat = 42.61389  
		mypos.lon = -82.83691
	else
	-- KPHN
		mypos.lat = 42.9109722 
		mypos.lon = -82.5288611
	end
	return mypos
end

function getClosestIndex(metarTable,myPosTable)
	local closest = 0
	local dist = 100000.11111
	local tdist = 0
	
	for i = 0,#metarTable do
		tdist = distanceNM(
			metarTable[i].lat,
			metarTable[i].lon,
			myPosTable.lat,
			myPosTable.lon )
		--print(tdist)
		if  tdist < dist then
			dist = tdist
			closest = i
			--print("dist,closest " .. dist .. closest)
		end
		--print(metarTable[i].icao .. " " .. tdist)
	end
	
	return closest
end
mypos = {}
weatherTable = {}	
loadData()
--print("KDTW-KMTC: " .. distanceNM(42.21242,-83.35339,42.61389, -82.83691)) -- kdtw kmtc
--print("KDTW-KMTC: " .. distanceNM(weatherTable[0].lat,weatherTable[0].lat,weatherTable[1].lat,weatherTable[1].lat))
--print("KDTW-KYIP: " .. distanceNM(weatherTable[0].lat,weatherTable[0].lat,mypos.lat,mypos.lon)) -- kdtw kyip
--print("KDTW-KPHN: " .. distanceNM(weatherTable[0].lat,weatherTable[0].lat,weatherTable[2].lat,weatherTable[2].lat)) 
--print("KMTC-KPHN: " .. distanceNM(weatherTable[1].lat,weatherTable[1].lat,weatherTable[2].lat,weatherTable[2].lat)) 
local atable = currentPosition(3)
local closestindex = getClosestIndex(weatherTable,atable)
print("Current Pos: " .. atable.lat .. " " .. atable.lon)
print("Closest Index = " .. closestindex .. " " .. weatherTable[closestindex].icao)
--print("Closest Index = " .. getClosestIndex(weatherTable,atable))
