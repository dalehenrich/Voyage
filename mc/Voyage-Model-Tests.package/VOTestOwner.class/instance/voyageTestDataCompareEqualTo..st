comparison
voyageTestDataCompareEqualTo: aTestOwner
	"let's keep this simple :)"

	(super voyageTestDataCompareEqualTo: aTestOwner)
		ifFalse: [ ^ false ].
	^ self name = aTestOwner name