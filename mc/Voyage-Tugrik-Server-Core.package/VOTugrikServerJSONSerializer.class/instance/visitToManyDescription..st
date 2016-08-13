visiting
visitToManyDescription: aDescription
  (aDescription accessor read: self object)
    ifNotNil: [ :objects | self rawSerialize: objects description: aDescription ]