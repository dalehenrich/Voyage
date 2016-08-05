*Voyage-JSON
doesNotUnderstand: aMessage
	^(self objectClass canUnderstand: aMessage selector)
		ifTrue: [ nil ]
		ifFalse: [ super doesNotUnderstand: aMessage ]
