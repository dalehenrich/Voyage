comparison
voyageTestDataCompareEqualTo: aTestPet
	(super voyageTestDataCompareEqualTo: aTestPet)
		ifFalse: [ ^ false ].
	^ self name = aTestPet name and: [ self owner voyageTestDataCompareEqualTo: aTestPet owner ]