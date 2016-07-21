private
flush
	| session |
	[ session := sessions nextOrNil.
	session notNil ] whileTrue: [ activeSessions add: session ].
	activeSessions copy do: [ :aSession | self returnToPool: aSession ]