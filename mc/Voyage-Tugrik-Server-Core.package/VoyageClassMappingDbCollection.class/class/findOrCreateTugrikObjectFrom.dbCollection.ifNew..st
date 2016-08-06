object creation
findOrCreateTugrikObjectFrom: aDictionary dbCollection: aTugrikDbCollection ifNew: newBlock
  "find an existing object with given oid or create a new object with given oid"

  | type objectClass |
  type := aDictionary
    at: VOMongoJSONSerializer fieldType
    ifAbsent: [ 
      "no field type - will have to create a generic object"
      ^ super
        createTugrikObjectFrom: aDictionary
        dbCollection: aTugrikDbCollection
        ifNew: newBlock ].
  objectClass := Smalltalk
    at: (aDictionary at: VOMongoJSONSerializer fieldType) asSymbol
    ifAbsent: [ 
      "class not found, will have to create a generic object"
      ^ super
        createTugrikObjectFrom: aDictionary
        dbCollection: aTugrikDbCollection
        ifNew: newBlock ].
  ^ self
    findOrCreateObjectOf: objectClass
    dbCollection: aTugrikDbCollection
    json: aDictionary
    ifNew: newBlock