printing
printOn: aStream 

	super initialize.
	sessionDescription ifNotNil: [ aStream nextPutAll: ' ', sessionDescription stoneHost, ' '].
	databaseName ifNotNil: [ aStream nextPutAll: databaseName ].