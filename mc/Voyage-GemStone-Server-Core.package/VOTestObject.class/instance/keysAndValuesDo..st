ston
keysAndValuesDo: aBlock
  "Dictionary simulation --- STON treats this guy as a map"

  self class allInstVarNames
    do: [ :ivar | 
      ivar == #'_oidValue'
        ifFalse: [ aBlock value: ivar asString value: (self instVarNamed: ivar) ] ].
  self dynamicInstanceVariables
    do: [ :dynVar | aBlock value: dynVar asString value: (super dynamicInstVarAt: dynVar) ]