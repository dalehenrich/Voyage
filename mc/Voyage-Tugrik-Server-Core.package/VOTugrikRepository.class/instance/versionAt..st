accessing
versionAt: anId
  "brute force lookup ... normally not used on the server"

  self db collections
    do: [ :collectionDb | 
      (collectionDb objWithOid: anId ifAbsent: [  ])
        ifNotNil: [ :wrapper | ^ wrapper _obj dynamicInstVarAt: self db fieldVersionSymbol ] ].
  ^ nil