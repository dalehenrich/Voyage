persistence
selectMany: aClass where: aDictionary limit: theLimit offset: offset
  | result limit stop |
  result := (((self collectionAt: aClass inDatabase: self db)
    selectCollection: aDictionary)
    collect: [ :wrapper | wrapper _obj ]
    as: self collectionClass) select: [ :each | each isKindOf: aClass ].
  stop := result size.
  limit := theLimit
    ifNil: [ 
      offset == 0
        ifTrue: [ ^ result ].
      stop ].
  offset >= stop
    ifTrue: [ ^ result class new: 0 ].
  stop - offset > limit
    ifTrue: [ stop := offset + limit ].
  ^ result copyFrom: offset + 1 to: stop