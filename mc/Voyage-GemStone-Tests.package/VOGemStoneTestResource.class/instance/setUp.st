running
setUp
	super setUp.
	repository := VOGemStoneRepository
		sessionDescription: self class sessionDescription
		dbServerClassName: self dbServerClassName
		database: 'Voyage-Tests'