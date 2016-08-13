tests
testServerSideMaterializationSerialization
	| pilot answer ar cl |
	pilot := VOTestPilot new
		name: 'Pilot1';
		yourself.
	self repository save: pilot.
	ar := [ VORepository current abort.	"abort needed to make sure that block sees latest view"
	{pilot.
	(pilot class == VOTestPilot).
	pilot class name} ] voyageDoOnServer: self repository.
	answer := ar at: 1.
	self assert: (ar at: 2).
	self assert: (cl := answer class) == VOTestPilot.
	self assert: answer name = pilot name.
	self assert: answer == pilot