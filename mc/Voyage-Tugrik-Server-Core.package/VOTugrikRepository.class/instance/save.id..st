persistence
save: anObject id: idObject
  | db collectionName dbCollection wrapper theOid |
  db := self db.
  collectionName := db collectionNameFor: anObject class.
  dbCollection := db collectionNamed: collectionName.
  theOid := idObject
    ifNotNil: [ :oid | 
      (dbCollection objWithOid: oid ifAbsent: [  ])
        ifNotNil: [ :existingWrapper | ^ existingWrapper ].
      oid ]
    ifNil: [ OID nextOID ].
  wrapper := (anObject dynamicInstVarAt: db fieldWrapperSymbol)
    ifNil: [ 
      VoyageWrapperObject new
        _id: theOid;
        _obj: anObject;
        yourself ].
  dbCollection add: wrapper