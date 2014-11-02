R = 6371

radians = (degrees) ->
    degrees * Math.PI / 180

a =
    lat: 51.0824401
    lon: 3.714485
b =
    lat: 51.0560802
    lon: 3.725672

for i in [1..100000]
    x = (radians b.lon - a.lon) * Math.cos (radians a.lat + b.lat) / 2
    y = radians b.lat - a.lat
    d = R * Math.sqrt x*x + y*y

console.log d

###
To go from a beeline distance to a more realistic distance, 
adding about 1.5 does the trick.

g = require 'ngeohash'
g.encode(51.0824401, 3.714485)
'u14dse2bc'

Procedure: 

1. geocode the requested address (using Google's API)
2. add/remove a certain distance to get our bounding box
3. get relevant geohashes: geohash.bboxes (minlat, minlon, maxlat, maxlon)
4. do key lookups in our big POI hash

(Request POI hash using a cache buster, so we can cache indefinitely.)
###