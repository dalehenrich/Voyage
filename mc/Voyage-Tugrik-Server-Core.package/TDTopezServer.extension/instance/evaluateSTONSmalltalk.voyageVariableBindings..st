*voyage-tugrik-server-core
evaluateSTONSmalltalk: smalltalkSource voyageVariableBindings: voyageVariableBindingsSTONString
  | result variableBindings voyageVariableBindings |
  voyageVariableBindings := self objectSerializer
    fromString: voyageVariableBindingsSTONString.
  variableBindings := Dictionary new.
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
          voyageWrapper := dbCollection
            findOrCreateTugrikObjectFrom: obj
            dbCollection: dbCollection
            ifNew: [ :ignored |  ].
          variableBindings at: key put: voyageWrapper _obj ]
        ifAbsent: [ variableBindings at: key put: obj ] ].
  result := self
    evaluateSmalltalk: smalltalkSource
    variableBindings: variableBindings.
  ^ (result dynamicInstVarAt: #'_wrapper')
    ifNil: [ self objectSerializer toString: result ]
    ifNotNil: [ :wrapper | self objectSerializer toString: wrapper ]