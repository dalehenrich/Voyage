tests
testServerSideMaterializationSerialization
	| pilot answer ar |
	pilot := VOTestPilot new
		name: 'Pilot1';
		yourself.
	ar := [ {pilot.
	(pilot class == VOTestPilot).
	pilot class name} ] voyageDoOnServer: self repository.
	answer := ar at: 1.
	self assert: (ar at: 2).
	self assert: answer class == VOTestPilot.
	self assert: answer name = pilot name.
	self assert: answer == pilot