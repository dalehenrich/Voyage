serialization
serializeRootObjectForLocalSave: anObject
  "visit anObject and return the futures (unsaved) objects gleaned from the graph for processing as saved objects (assign oid and wrap)"

  | oid |
  oid := (anObject dynamicInstVarAt: VOTugrikJSONSerializer fieldWrapperSymbol)
    ifNotNil: [ :wrapper | wrapper _id ].
  ^ self newServerSerializer serialize: anObject id: oid