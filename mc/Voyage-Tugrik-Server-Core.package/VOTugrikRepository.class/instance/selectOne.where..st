persistence
selectOne: aClass where: aDictionaryOrBlock
  | collectionDb |
  collectionDb := self collectionAt: aClass inDatabase: self db.
  ^ (((aDictionaryOrBlock voyageSelectCollectionFor: collectionDb)
    collect: [ :wrapper | wrapper _obj ]
    as: self collectionClass) select: [ :each | each isKindOf: aClass ])
    detect: [ :each | true ]
    ifNone: [  ]