accessing
reset
	collections := Dictionary new.
	pool ifNotNil: [ pool flush ].
	pool := VOGemStoneSessionPool 
		sessionDescription: repository sessionDescription 
		dbServerClassName: self dbServerClassName
		database: repository databaseName.
	pool size: repository poolSize.