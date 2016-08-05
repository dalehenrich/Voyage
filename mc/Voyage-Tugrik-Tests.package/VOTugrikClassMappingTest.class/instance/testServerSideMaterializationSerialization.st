tests
testServerSideMaterializationSerialization
	| pilot databaseName answer |
	pilot := VOTestPilot new
		name: 'Pilot1';
		yourself.
	databaseName := self repository databaseName.
	answer := [ pilot ] voyageDoOnServer: self repository.
	self assert: answer class == VOTestPilot.
	self assert: answer name = pilot name.
	self assert: answer == pilot