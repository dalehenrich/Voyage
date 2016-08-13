*voyage-tugrik-server-core
voyageSelectCollectionFor: collectionDb
  | query |
  query := self asMongoQuery.
  query == false
    ifTrue: [ 
      "if I cannot be converted to a mongo Query, see if I work as a select block as is"
      ^ collectionDb selectCollectionWithBlock: self ].
  ^ collectionDb selectCollection: query