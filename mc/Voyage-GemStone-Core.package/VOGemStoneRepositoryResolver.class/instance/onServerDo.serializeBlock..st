server blocks
onServerDo: aBlock serializeBlock: serializeBlock
	self pool
		withSession: [ :tugrik | 
			| json |
			json := tugrik onServerDo: aBlock serializeBlock: serializeBlock.
			json isCollection
				ifFalse: [ ^ json ].
			^ json isDictionary
				ifTrue: [ self retrieveObjectFromJson: json ]
				ifFalse: [ json collect: [ :each | self retrieveObjectFromJson: each ] ] ]