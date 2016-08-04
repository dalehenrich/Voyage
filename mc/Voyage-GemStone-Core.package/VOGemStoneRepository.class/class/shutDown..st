system startup
shutDown: quitting
	self current ifNil: [ ^ self ].
	quitting
		ifTrue: [ self current shutDown ]