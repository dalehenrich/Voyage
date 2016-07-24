accessing
collections
  | dbColl |
  super collections.
  dbColl := collections
    at: self collectionName
    put:
      (VoyageExamplesDbCollection named: self collectionName collectionDb: self).
  dbColl createCollection.
  ^ collections