printing
printOn: aStream
  databaseName ifNotNil: [ aStream nextPutAll: databaseName ]