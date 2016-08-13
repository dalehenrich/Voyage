materialization
findOrCreateObjectOf: objectClass dbCollection: aTugrikDbCollection json: aDictionary ifNew: newBlock
  | oid object theWrapper |
  oid := aDictionary
    at: self fieldRootId
    ifPresent: [ :anOid | 
      (aTugrikDbCollection objWithOid: anOid ifAbsent: [  ])
        ifNotNil: [ :wrapper | 
          wrapper _isPartial
            ifTrue: [ 
              self
                materialize: wrapper _obj
                fromJSON: aDictionary
                dbCollection: aTugrikDbCollection.
              wrapper _isPartial: false ].
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