system startup
startUp: resumming
	self current ifNil: [ ^ self ].
	resumming
		ifTrue: [ self current startUp ]