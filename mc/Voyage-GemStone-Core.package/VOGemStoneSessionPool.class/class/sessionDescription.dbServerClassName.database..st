instance creation
sessionDescription: aSessionDescription dbServerClassName: dbServerClassName database: databaseString
	^ self basicNew
		dbServerClassName: dbServerClassName;
		initializeSessionDescription: aSessionDescription database: databaseString;
		yourself