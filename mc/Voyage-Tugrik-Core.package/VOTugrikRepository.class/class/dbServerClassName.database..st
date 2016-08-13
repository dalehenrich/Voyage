instance creation
dbServerClassName: dbServerClassName database: databaseString
	^ self
		sessionDescription: self defaultSessionDescription
		dbServerClassName: dbServerClassName
		database: databaseString