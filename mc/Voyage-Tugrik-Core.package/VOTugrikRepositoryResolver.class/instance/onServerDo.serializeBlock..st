server blocks
onServerDo: aBlock serializeBlock: serializeBlock
	self pool
		withSession: [ :tugrik | 
			| json variableBindings |
			 variableBindings := Dictionary new.
			variableBindings at: '#databaseName'  put: self databaseName.
			variableBindings at: '#dbServerClassName'  put: self dbServerClassName.
			json := tugrik onVoyageServerDo: aBlock serializeBlock: serializeBlock variableBindings: variableBindings.
			json isCollection
				ifFalse: [ ^ json ].
			^ json isDictionary
				ifTrue: [ self retrieveObjectFromJson: json db: (tugrik databaseNamed: self databaseName)]
				ifFalse: [ json collect: [ :each | self retrieveObjectFromJson: each db: (tugrik databaseNamed: self databaseName) ] ] ]