tests
testServerBlock01Forwarding
	| pilot pilot2 pilot3 databaseName answer |
	pilot := VOTestPilot new
		aux: 'Pilot1';
		yourself.
	pilot2 := VOTestPilot new
		aux: 'Pilot2';
		yourself.
	pilot3 := VOTestPilot new
		aux: 'Pilot3';
		yourself.
	self repository save: pilot.
	self repository save: pilot2.
	self repository save: pilot3.
	databaseName := self repository databaseName.

	"lookup and return object wrappper, using VOTestPilot messages and get proper instance on client"
	answer := [ | db collection |
	VORepository current abort.	"abort needed to make sure that block sees latest view"
	db := (Smalltalk at: #VoyageClassMappingDbServer) databaseNamed: databaseName.
	collection := (db collections at: 'TestPilot') collection.
	collection
		detect: [ :aPilot | aPilot aux = pilot3 aux ]
		ifNone: [ self error: 'sorry charlie' ]
	"only a partial solution until dynamicInstVar support added to ProtoObject on Server" ]
		voyageDoOnServer: self repository.
	self assert: answer class == VOTestPilot.
	self assert: answer aux = pilot3 aux.
	self assert: answer == pilot3