instance creation
sessionDescription: sessionDescription database: databaseString
	^ self basicNew
		initializeSessionDescription: sessionDescription database: databaseString;
		yourself