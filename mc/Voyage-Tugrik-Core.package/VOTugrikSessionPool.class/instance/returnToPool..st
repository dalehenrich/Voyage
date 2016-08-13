accessing
returnToPool: aSession
	self mutex
		critical: [ activeSessions remove: aSession ifAbsent: [  ].
			sessions nextPut: aSession ]