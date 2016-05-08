running
setUp
	super setUp.
	repository := VOGemStoneRepository
		sessionDescription: self class sessionDescription
		database: 'Voyage-Tests'