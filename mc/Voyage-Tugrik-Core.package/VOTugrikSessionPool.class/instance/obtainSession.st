accessing
obtainSession
	| session |
	self repopulate.
	self mutex
		critical: [ session := sessions next.
			activeSessions add: (self ensureConnected: session) ].
	^ session