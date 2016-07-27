tests
testBasicServerBlock
	| pilot pilot2 pilot3 mongoQuery retrievedPilots databaseName |
	pilot := VOTestPilot new.
	pilot keywords add: 'Smalltalk'.
	pilot keywords add: 'Argentina'.
	
	pilot2 := VOTestPilot new.
	pilot2 keywords add: 'Smalltalk'.
	
	pilot3 := VOTestPilot new.

	self repository save: pilot.
	self repository save: pilot2.
	self repository save: pilot3.
	self repository cache flush.
	
	mongoQuery :=  Dictionary new
		at: 'keywords' put: (Dictionary new 
			at: '$all' put: #('Smalltalk' 'Argentina');
			yourself );
		yourself.
	
	databaseName := self repository databaseName.
	retrievedPilots := [ ((Smalltalk at: #TugrikDbServer) databaseNamed: databaseName)
		selectCollectionNamed: 'TestPilot'
		queryDict: mongoQuery ] voyageDoOnServer: self repository.

	self assert: retrievedPilots size equals: 1.