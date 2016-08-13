voyage repository
selectOne: aClass where: queryDict
  | collectionName |
  collectionName := self collectionNameFor: aClass.
  ^ (self selectCollectionNamed: collectionName queryDict: queryDict)
    detect: [ :each | true ]
    ifNone: [  ]