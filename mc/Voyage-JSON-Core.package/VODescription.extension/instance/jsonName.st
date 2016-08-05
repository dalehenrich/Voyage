*Voyage-JSON-Core
jsonName 
	^ (self 
		propertyAt: #jsonName  
		ifAbsent: [ self attributeName ])
		asString