accessing
dynamicInstVarAt: key put: anObject
  (self class allInstVarNames includes: key)
    ifTrue: [ ^ self instVarNamed: key put: anObject ].
  ^ super dynamicInstVarAt: key put: anObject