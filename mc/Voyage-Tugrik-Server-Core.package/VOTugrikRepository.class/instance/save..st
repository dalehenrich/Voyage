persistence
save: anObject
  "this needs to be a place where we visit the structure and calculate futures and save all of the futures"

  | db collectionName dbCollection futures |
  db := self db.
  futures := db serializeRootObjectForLocalSave: anObject.
  futures
    do: [ :future | 
      | realObject futureId |
      realObject := future realObject.
      realObject
        dynamicInstVarAt: db fieldVersionSymbol
        put: self versionGenerator newVersion.
      collectionName := db collectionNameFor: realObject class.
      dbCollection := db collectionNamed: collectionName.
      futureId := future futureId.
      (dbCollection objWithOid: futureId ifAbsent: [  ])
        ifNil: [ 
          | wrapper |
          wrapper := (realObject dynamicInstVarAt: db fieldWrapperSymbol)
            ifNil: [ 
              VoyageWrapperObject new
                _id: futureId;
                _obj: realObject;
                yourself ].
          dbCollection add: wrapper ] ]