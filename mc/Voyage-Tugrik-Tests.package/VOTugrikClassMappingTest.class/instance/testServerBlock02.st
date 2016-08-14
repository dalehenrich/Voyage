tests
testServerBlock02
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

	"look up and return wrapper and get proper instance on client"
	answer := [ | db collection |
	db := (Smalltalk at: #VoyageClassMappingDbServer) databaseNamed: databaseName.
	collection := (db collections at: 'TestPilot') collection.
	collection
		detect: [ :aPilotWrapper | aPilotWrapper _obj name = pilot3 name ]
		ifNone: [ self error: 'sorry charlie' ] ] voyageDoOnServer: self repository.
	self assert: answer class == VOTestPilot.
	self assert: answer name = pilot3 name.
	self assert: answer == pilot3