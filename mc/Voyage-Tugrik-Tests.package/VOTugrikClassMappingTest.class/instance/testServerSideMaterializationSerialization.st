tests
testServerSideMaterializationSerialization
	| pilot  answer |
	pilot := VOTestPilot new
		name: 'Pilot1';
		yourself.
	answer := [ pilot ] voyageDoOnServer: self repository.
	self assert: answer class == VOTestPilot.
	self assert: answer name = pilot name.
	self assert: answer == pilot