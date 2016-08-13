ston
keysAndValuesDo: aBlock
  "Dictionary simulation --- STON treats this guy as a map"

  self halt.	"not the intended way for serializing wrapper objects ... if at all"
  aBlock value: VOTugrikJSONSerializer fieldRootId value: self _id.
  aBlock value: VOTugrikJSONSerializer fieldType value: self _obj class name.
  self _obj class allInstVarNames
    do: [ :ivar | aBlock value: ivar asString value: (self _obj instVarNamed: ivar) ].
  self _obj dynamicInstanceVariables
    do: [ :dynVar | 
      (dynVar == VOTugrikJSONSerializer fieldRootIdSymbol
        or: [ dynVar == VOTugrikJSONSerializer fieldWrapperSymbol ])
        ifFalse: [ aBlock value: dynVar asString value: (self _obj dynamicInstVarAt: dynVar) ] ]