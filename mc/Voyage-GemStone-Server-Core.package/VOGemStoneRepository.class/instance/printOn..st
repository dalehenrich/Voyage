printing
printOn: aStream
  super initialize.
  databaseName ifNotNil: [ aStream nextPutAll: databaseName ]