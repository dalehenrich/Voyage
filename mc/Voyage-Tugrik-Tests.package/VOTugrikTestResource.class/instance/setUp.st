running
setUp
	super setUp.
	repository := VOTugrikRepository
		sessionDescription: self class sessionDescription
		dbServerClassName: self dbServerClassName
		database: 'Voyage-Tests'