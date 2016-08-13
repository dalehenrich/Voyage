materialization
materialize: anObject fromJSON: jsonDictionary dbCollection: aTugrikDbCollection
  ^ (self materializerClass repository: self)
    materialize: anObject
    fromJSON: jsonDictionary