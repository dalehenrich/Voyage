server blocks
onServerDo: aBlock
	self pool
		withSession: [ :tugrik | 
			| json |
			json := tugrik onServerDo: aBlock.
			json isCollection
				ifFalse: [ ^ json ].
			^ json collect: [ :each | self retrieveObjectFromJson: each ] ]