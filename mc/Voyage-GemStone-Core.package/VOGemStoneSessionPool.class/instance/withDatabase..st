accessing
withDatabase: aBlock 
	"I process block with database instead a session, this is useful for fast access, since you regularly will be using a database and not a plain session. 
	I also do some minor error handling by reseting the connection if an error happens (to ensure it's clean)"
	| session db |
	session := self obtainSession.
	db := session databaseNamed: self database. 
	(self sessionDescription isNil not) ifTrue: [ 
		"set the sessionDescription if required"
		db sessionDescription: self sessionDescription.
	].
	[ ^aBlock value: db  ]
	ensure: [self returnToPool: session]