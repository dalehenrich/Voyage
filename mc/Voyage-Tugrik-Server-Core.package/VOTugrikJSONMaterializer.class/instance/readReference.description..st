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
    ifNil: [ self missingContentFor: objectClass id: (jsonDictionary at: self class fieldId) ]