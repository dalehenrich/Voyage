server blocks
onServerDo: aBlock
	self pool
		withSession: [ :tugrik | 
			| json |
			json := tugrik onServerDo: aBlock.
			json isCollection
				ifFalse: [ ^ json ].
			^ json isDictionary
				ifTrue: [ self retrieveObjectFromJson: json ]
				ifFalse: [ json collect: [ :each | self retrieveObjectFromJson: each ] ] ]