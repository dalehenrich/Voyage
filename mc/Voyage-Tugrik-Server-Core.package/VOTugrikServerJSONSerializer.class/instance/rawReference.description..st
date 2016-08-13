private raw
rawReference: anObject description: aDescription
  (self repository isNew: anObject)
    ifTrue: [ ^ self ensurePersisted: anObject ]