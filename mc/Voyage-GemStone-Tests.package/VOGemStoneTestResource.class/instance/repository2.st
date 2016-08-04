accessing
repository2
	^ repository2
		ifNil: [ repository2 := VOGemStoneRepository
				sessionDescription: self class sessionDescription
				dbServerClassName: self dbServerClassName
				database: 'Voyage-Tests' ]