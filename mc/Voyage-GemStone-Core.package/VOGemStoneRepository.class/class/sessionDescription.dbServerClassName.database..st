instance creation
sessionDescription: sessionDescription dbServerClassName: dbServerClassName database: databaseString
	^ self basicNew
		dbServerClassName: dbServerClassName;
		initializeSessionDescription: sessionDescription database: databaseString;
		yourself