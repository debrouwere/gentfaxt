fs = require 'fs'
_ = require 'underscore'


R = 6371

radians = (degrees) ->
    degrees * Math.PI / 180

a =
    lat: 51.0824401
    lon: 3.714485
b =
    lat: 51.0560802
    lon: 3.725672

round = (n, decimals) ->
    exp = Math.pow 10, decimals
    (Math.round n * exp) / exp

distance = (a, b) ->
    x = (radians b.lon - a.lon) * Math.cos (radians a.lat + b.lat) / 2
    y = radians b.lat - a.lat
    R * Math.sqrt x*x + y*y

console.log round (distance a, b), 2


POI = JSON.parse fs.readFileSync 'data/lidl.json', 'utf8'

here = b

distances = _.map POI, (there) ->
    distance there, here


console.log distances
