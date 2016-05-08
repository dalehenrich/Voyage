instance creation
sessionDescription: aSessionDescription database: databaseString
	^ self basicNew
		initializeSessionDescription: aSessionDescription database: databaseString;
		yourself