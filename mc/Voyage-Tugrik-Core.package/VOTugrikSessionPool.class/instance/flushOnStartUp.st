private
flushOnStartUp
	activeSessions copy do: [ :aSession | self returnToPool: aSession ].
	[ sessions isEmpty ] whileFalse: [ sessions nextOrNil ]