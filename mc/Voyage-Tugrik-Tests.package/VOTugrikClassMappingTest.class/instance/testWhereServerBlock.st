tests
testWhereServerBlock
	| pilot pilot2 pilot3 selected |
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
	selected := [ VORepository current abort.
		VORepository current
		selectOne: VOTestPilot
		where: [ :each |  each voyageTestDataCompareEqualTo: pilot ] ]
		voyageDoOnServer: self repository.
	self assert: (selected voyageTestDataCompareEqualTo: pilot)