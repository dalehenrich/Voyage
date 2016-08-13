*voyage-tugrik-server-core
evaluateSTONSmalltalk: smalltalkSource voyageVariableBindings: voyageVariableBindingsSTONString
  | result variableBindings voyageVariableBindings db currentRepository theDatabaseName theDbServerClassName theDbServerClass |
  voyageVariableBindings := self objectSerializer
    fromString: voyageVariableBindingsSTONString.
  variableBindings := Dictionary new.
  theDbServerClassName := (voyageVariableBindings
    at: '#dbServerClassName'
    ifAbsent: [  ])
    ifNil: [ 
      "the entry in voyageVariableBindings could be nil"
      'TugrikDbServer' ].
  voyageVariableBindings removeKey: '#dbServerClassName' ifAbsent: [  ].
  theDbServerClass := Smalltalk at: theDbServerClassName.
  voyageVariableBindings
    at: '#databaseName'
    ifPresent: [ :dbName | 
      theDatabaseName := dbName.
      theDbServerClass databaseNamed: dbName ]
    ifAbsent: [  ].
  voyageVariableBindings removeKey: '#databaseName' ifAbsent: [  ].
  voyageVariableBindings
    keysAndValuesDo: [ :key :attributeDict | 
      | voyageWrapper dbCollection obj |
      obj := attributeDict at: 'serializedObj'.
      attributeDict
        at: 'databaseName'
        ifPresent: [ :databaseName | 
          db := theDbServerClass databaseNamed: databaseName.
          dbCollection := db
            collectionNamed: (attributeDict at: 'collectionName').
          voyageWrapper := dbCollection
            findOrCreateTugrikObjectFrom: obj
            dbCollection: dbCollection
            ifNew: [ :ignored |  ].
          variableBindings at: key put: voyageWrapper _obj ]
        ifAbsent: [ variableBindings at: key put: obj ] ].
  currentRepository := VOTugrikRepository current.
  [ 
  theDatabaseName
    ifNotNil: [ 
      (VOTugrikRepository
        dbServerClassName: theDbServerClassName
        database: theDatabaseName) enableSingleton ].
  result := self
    evaluateSmalltalk: smalltalkSource
    variableBindings: variableBindings ]
    ensure: [ VOTugrikRepository setRepository: currentRepository ].
  db
    ifNil: [ 
      "probably should make databaseName an explicit argument to this method"
      "https://github.com/dalehenrich/voyage/issues/7"
      ^ self objectSerializer toString: result ].
  ^ db serializeResult: result using: self objectSerializer