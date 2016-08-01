private
createCollections
  | dbColl |
  super createCollections.
  dbColl := collections
    at: self collectionName
    put:
      (VoyageExamplesDbCollection named: self collectionName collectionDb: self).
  dbColl createCollection.
  dbColl := collections
    at: 'Internal Talk'
    put:
      (Voyage08042016TalkCollection named: 'Internal Talk' collectionDb: self).
  dbColl createCollection