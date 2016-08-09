server blocks
onServerDo: aBlock serializeBlock: serializeBlock
	self pool
		withSession: [ :tugrik | 
			| json |
			json := tugrik onVoyageServerDo: aBlock serializeBlock: serializeBlock.
			json isCollection
				ifFalse: [ ^ json ].
			^ json isDictionary
				ifTrue: [ self retrieveObjectFromJson: json db: (tugrik databaseNamed: self databaseName)]
				ifFalse: [ json collect: [ :each | self retrieveObjectFromJson: each db: (tugrik databaseNamed: self databaseName) ] ] ]