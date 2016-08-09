persistence
count: aClass
  ^ (self collectionAt: aClass inDatabase: self db) size