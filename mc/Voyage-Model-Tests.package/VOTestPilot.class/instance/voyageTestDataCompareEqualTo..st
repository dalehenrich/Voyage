comparison
voyageTestDataCompareEqualTo: aTestPilot
	(super voyageTestDataCompareEqualTo: aTestPilot)
		ifFalse: [ ^ false ].
	^ self name = aTestPilot name
		and: [ self creationDate = aTestPilot creationDate
				and: [ (self currency voyageTestDataCompareEqualTo: aTestPilot currency)
						and: [ self pet voyageTestDataCompareEqualTo: aTestPilot pet ] ] ]