*voyage-tugrik-server-core
evaluateSTONSmalltalk: smalltalkSource voyageVariableBindings: voyageVariableBindingsSTONString
  | result variableBindings voyageVariableBindings db |
  voyageVariableBindings := self objectSerializer
    fromString: voyageVariableBindingsSTONString.
  variableBindings := Dictionary new.
  voyageVariableBindings
    keysAndValuesDo: [ :key :attributeDict | 
      | voyageWrapper dbCollection obj |
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
  self halt.
  db
    ifNil: [ 
      "probably should make databaseName an explicit argument to this method"
      "https://github.com/dalehenrich/voyage/issues/7"
      ^ self objectSerializer toString: result ].
  ^ db serialize: result using: self objectSerializer