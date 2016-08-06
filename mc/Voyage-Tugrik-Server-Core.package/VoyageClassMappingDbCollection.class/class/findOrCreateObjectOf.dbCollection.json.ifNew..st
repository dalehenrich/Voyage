object creation
findOrCreateObjectOf: objectClass dbCollection: aTugrikDbCollection json: aDictionary ifNew: newBlock
  | oid object theWrapper |
  oid := aDictionary
    at: self fieldRootId
    ifPresent: [ :anOid | 
      (aTugrikDbCollection objWithOid: anOid ifAbsent: [  ])
        ifNotNil: [ :wrapper | 
          "found the object, mission accomplished"
          ^ wrapper ].
      anOid ]
    ifAbsent: [ OID nextOID ].
  theWrapper := VoyageWrapperObject new
    _id: oid;
    yourself.
  object := (self retrieveClassOf: objectClass json: aDictionary) basicNew.
  self
    materialize: object
    fromJSON: aDictionary
    dbCollection: aTugrikDbCollection.
  theWrapper _obj: object.
  newBlock value: theWrapper.
  ^ theWrapper