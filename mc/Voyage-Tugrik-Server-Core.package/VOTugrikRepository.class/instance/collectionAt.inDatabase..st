persistence
collectionAt: aClass inDatabase: db
  | collectionName |
  collectionName := db collectionNameFor: aClass.
  ^ db collectionNamed: collectionName