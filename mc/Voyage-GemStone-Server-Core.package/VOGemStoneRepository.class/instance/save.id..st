persistence
save: anObject id: idObject
  | db collectionName data |
  idObject ifNotNil: [ ^ self ].
  TugrikDbServer
    transact: [ 
      db := TugrikDbServer databaseNamed: self databaseName.
      collectionName := self collectionNameFor: anObject class.
      db insertOperation: -1 collectionName: collectionName data: data ]