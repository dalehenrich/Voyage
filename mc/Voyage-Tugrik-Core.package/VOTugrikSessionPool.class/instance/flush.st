private
flush
	activeSessions copy do: [ :aSession | self returnToPool: aSession ].
	super flush