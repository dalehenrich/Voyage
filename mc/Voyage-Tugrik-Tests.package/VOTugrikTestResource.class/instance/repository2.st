accessing
repository2
	^ repository2
		ifNil: [ repository2 := VOTugrikRepository
				sessionDescription: self class sessionDescription
				dbServerClassName: self dbServerClassName
				database: 'Voyage-Tests' ]