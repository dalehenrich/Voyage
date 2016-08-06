accessing
hasField: aSymbol
  aSymbol == #'_id'
    ifTrue: [ ^ true ].
  ^ (self _obj dynamicInstanceVariables includes: aSymbol)
    or: [ self _obj class allInstVarNames includes: aSymbol ]