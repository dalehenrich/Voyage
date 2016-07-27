*voyage-gemstone-server-core
evaluateSTONSmalltalk: smalltalkSource voyageVariableBindings: voyageVariableBindingsSTONString
  | result variableBindings voyageVariableBindings |
  voyageVariableBindings := self objectSerializer
    fromString: voyageVariableBindingsSTONString.
  variableBindings := Dictionary new.
  voyageVariableBindings
    keysAndValuesDo: [ :key :attributeDict | 
      | voyageObj db dbCollection obj |
      obj := attributeDict at: 'serializedObj'.
      attributeDict
        at: 'databaseName'
        ifPresent: [ :databaseName | 
          db := TugrikDbServer databaseNamed: databaseName.
          dbCollection := db
            collectionNamed: (attributeDict at: 'collectionName').
          voyageObj := VoyageClassMappingDbCollection
            createTugrikObjectFrom: obj
            dbCollection: dbCollection
            ifNew: [ :ignored |  ].
          variableBindings at: key put: voyageObj ]
        ifAbsent: [ variableBindings at: key put: obj ] ].
  result := self
    evaluateSmalltalk: smalltalkSource
    variableBindings: variableBindings.
  ^ self objectSerializer toString: result