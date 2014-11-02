download:
	mkdir -p data
	http https://spatial.virtualearth.net/REST/v1/data/2be5f76f36e8484e965e84b7ee0cd1b1/Filialdaten-BE/Filialdaten-BE?spatialFilter=nearby\(51.04779815673828,3.7055699825286865,10\)&$filter=Adresstyp%20Eq%201&$select=EntityID,Latitude,Longitude,AddressLine,PostalCode,Locality,Bilanzgesellschaft,OpeningTimes,INFOICON1,INFOICON2,INFOICON3,INFOICON4,INFOICON5,AR,NF,Adresstyp,OverlayOperatorData,ShownPostalCode,ShownLocality,ShownAddressLine,ShownStoreName&$top=11&$format=json&$skip=0&key=AvGfUYinH_I7qdNZWDlXTHHysoytHWqkqZpxHBN9Z0Z0YLQup0u6qZoB8uQXUW_p > data/lidl.json
