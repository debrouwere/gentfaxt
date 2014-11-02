fs = require 'fs'

raw = fs.readFileSync 'data/raw/lidl.json', 'utf8'
data = JSON.parse raw

stores = []

for store in data.d.results
    stores.push store =
        address: store.AddressLine
        hours: store.OpeningTimes
        lat: store.Latitude
        lon: store.Longitude

serialization = JSON.stringify stores, undefined, 4
fs.writeFileSync 'data/lidl.json', serialization, 'utf8'
