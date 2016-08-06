*voyage-tugrik-server-core
evaluateSTONSmalltalk: smalltalkSource voyageVariableBindings: voyageVariableBindingsSTONString
  | result variableBindings voyageVariableBindings wrapperMap |
  voyageVariableBindings := self objectSerializer
    fromString: voyageVariableBindingsSTONString.
  variableBindings := Dictionary new.
  wrapperMap := IdentityKeyValueDictionary new.
  voyageVariableBindings
    keysAndValuesDo: [ :key :attributeDict | 
      | voyageWrapper db dbCollection obj |
      obj := attributeDict at: 'serializedObj'.
      attributeDict
        at: 'databaseName'
        ifPresent: [ :databaseName | 
          db := TugrikDbServer databaseNamed: databaseName.
          dbCollection := db
            collectionNamed: (attributeDict at: 'collectionName').
          voyageWrapper := VoyageClassMappingDbCollection
            visitTugrikObjectFrom: obj
            dbCollection: dbCollection
            ifNew: [ :ignored |  ].
          wrapperMap at: voyageWrapper _obj put: voyageWrapper.
          variableBindings at: key put: voyageWrapper _obj ]
        ifAbsent: [ variableBindings at: key put: obj ] ].
  result := self
    evaluateSmalltalk: smalltalkSource
    variableBindings: variableBindings.
  ^ wrapperMap
    at: result
    ifPresent: [ :wrapper | self objectSerializer toString: wrapper ]
    ifAbsent: [ self objectSerializer toString: result ]