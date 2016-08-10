persistence
count: aClass where: queryDictOrBlock
  | collectionName queryDict sizeForQueryDict |
  collectionName := self db collectionNameFor: aClass.
  queryDict := queryDictOrBlock asMongoQuery.
  sizeForQueryDict := Dictionary new
    at: 'query' put: queryDict;
    at: 'fields' put: Dictionary new;
    yourself.
  ^ (self db countCollectionNamed: collectionName queryDict: sizeForQueryDict)
    at: 'n'