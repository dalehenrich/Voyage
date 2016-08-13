instance creation
database: databaseString
	^self 
		sessionDescription: self defaultSessionDescription database: databaseString