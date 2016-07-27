*voyage-gemstone-server-core
evaluateSTONSmalltalk: smalltalkSource voyageVariableBindings: voyageVariableBindingsSTONString
  | result variableBindings voyageVariableBindings |
  voyageVariableBindings := self objectSerializer
    fromString: voyageVariableBindingsSTONString.
  variableBindings := Dictionary new.
  voyageVariableBindings
    keysAndValuesDo: [ :key :attributeDict | 
      | voyageObj db dbCollection obj |
      db := TugrikDbServer databaseNamed: (attributeDict at: 'databaseName').
      dbCollection := db collectionNamed: (attributeDict at: 'collectionName').
      obj := attributeDict at: 'serializedObj'.
      voyageObj := VoyageClassMappingDbCollection
        createTugrikObjectFrom: obj
        dbCollection: dbCollection
        ifNew: [ :ignored |  ].
      variableBindings at: key put: voyageObj ].
  result := self
    evaluateSmalltalk: smalltalkSource
    variableBindings: variableBindings.
  ^ self objectSerializer toString: result