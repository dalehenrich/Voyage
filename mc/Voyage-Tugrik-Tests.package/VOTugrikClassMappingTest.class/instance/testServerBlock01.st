tests
testServerBlock01
	| pilot pilot2 pilot3 databaseName answer |
	pilot := VOTestPilot new
		name: 'Pilot1';
		yourself.
	pilot2 := VOTestPilot new
		name: 'Pilot2';
		yourself.
	pilot3 := VOTestPilot new
		name: 'Pilot3';
		yourself.
	self repository save: pilot.
	self repository save: pilot2.
	self repository save: pilot3.
	databaseName := self repository databaseName.

	"lookup and return wrapped object and get proper instance on client"
	answer := [ | db collection ans |
	VORepository current abort.	"abort needed to make sure that block sees latest view"
	db := (Smalltalk at: #VoyageClassMappingDbServer) databaseNamed: databaseName.
	collection := (db collections at: 'TestPilot') collection.
	ans := collection
		detect: [ :aPilot | aPilot _obj name = pilot3 name ]
		ifNone: [ self error: 'sorry charlie' ].
	ans _obj ] voyageDoOnServer: self repository.
	self assert: answer class == VOTestPilot.
	self assert: answer name = pilot3 name.
	self assert: answer == pilot3