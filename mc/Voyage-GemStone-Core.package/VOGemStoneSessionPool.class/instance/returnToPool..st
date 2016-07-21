accessing
returnToPool: aSession
	self mutex
		critical: [ activeSessions remove: aSession ifAbsent: [  ].
			self ensureDisconnected: aSession.
			sessions nextPut: aSession ]