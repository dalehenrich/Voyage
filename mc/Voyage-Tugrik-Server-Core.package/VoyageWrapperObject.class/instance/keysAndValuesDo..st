ston
keysAndValuesDo: aBlock
  "Dictionary simulation --- STON treats this guy as a map"

  aBlock value: '_id' value: self _id.
  self _obj class allInstVarNames
    do: [ :ivar | 
      ivar == #'_oidValue'
        ifFalse: [ aBlock value: ivar asString value: (self _obj instVarNamed: ivar) ] ].
  self _obj dynamicInstanceVariables
    do: [ :dynVar | aBlock value: dynVar asString value: (self _obj dynamicInstVarAt: dynVar) ]