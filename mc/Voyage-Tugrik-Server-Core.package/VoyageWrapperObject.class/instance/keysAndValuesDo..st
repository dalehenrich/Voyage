ston
keysAndValuesDo: aBlock
  "Dictionary simulation --- STON treats this guy as a map"

  aBlock value: VOTugrikJSONSerializer fieldRootId value: self _id.
  self _obj class allInstVarNames
    do: [ :ivar | aBlock value: ivar asString value: (self _obj instVarNamed: ivar) ].
  self _obj dynamicInstanceVariables
    do: [ :dynVar | 
      (dynVar == VOTugrikJSONSerializer fieldRootIdSymbol
        or: [ dynVar == VOTugrikJSONSerializer fieldWrapperSymbol ])
        ifFalse: [ aBlock value: dynVar asString value: (self _obj dynamicInstVarAt: dynVar) ] ]