accessing
repository2
	^ repository2
		ifNil:
			[ repository2 := VOMongoRepository host: self class mongoHost database: 'Voyage-Tests' ]