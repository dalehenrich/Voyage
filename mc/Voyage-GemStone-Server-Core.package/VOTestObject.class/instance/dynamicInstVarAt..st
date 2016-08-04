accessing
dynamicInstVarAt: key
  (self class allInstVarNames includes: key)
    ifTrue: [ ^ self instVarNamed: key ].
  ^ super dynamicInstVarAt: key