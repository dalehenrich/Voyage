persistence
collectionAt: aClass inDatabase: db
  | collectionName |
  collectionName := self collectionNameFor: aClass.
  ^ (db collections at: collectionName) collection