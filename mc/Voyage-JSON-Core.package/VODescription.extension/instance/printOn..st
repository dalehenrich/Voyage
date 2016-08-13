*Voyage-JSON-Core
printOn: aStream
	aStream nextPutAll: (self attributeName ifNil: [ 'Undefined' ])