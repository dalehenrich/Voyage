object creation
materialize: anObject fromJSON: jsonDictionary dbCollection: aTugrikDbCollection
  ^ (self materializerClass repository: aTugrikDbCollection)
    materialize: anObject
    fromJSON: jsonDictionary