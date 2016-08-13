comparison
voyageTestDataCompareEqualTo: aTestPilot
	aTestPilot species = self species
		ifFalse: [ ^ false ].
	^true