private
readReference: jsonDictionary description: aDescription
  "we want to materialize the whole graph"

  | objectClass |
  objectClass := self classFromJSON: jsonDictionary orDescription: aDescription.
  ^ (self repository
    selectOne: objectClass
    where:
      (Dictionary
        with: self class fieldRootId -> (jsonDictionary at: self class fieldId)))
    ifNotNil: [ :wrapper | wrapper _obj ]
    ifNil: [ 
      | partialObject theWrapper |
      "Reference to an object that has not been inserted yet (presumably in the list of futures).
       create a partial object and insert wrapper into the proper collection ..."
      partialObject := objectClass basicNew.
      theWrapper := VoyageWrapperObject new
        _id: (jsonDictionary at: self class fieldId);
        _obj: partialObject;
        _isPartial: true;
        yourself.
      (self repository collectionAt: objectClass inDatabase: self repository db)
        add: theWrapper.
      partialObject ]