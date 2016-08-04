accessing
hasField: aSymbol
  ^ (self dynamicInstanceVariables includes: aSymbol)
    or: [ self class allInstVarNames includes: aSymbol ]