accessing
dynamicInstVarAt: key put: anObject
  (self class allInstVarNames includes: key)
    ifTrue: [ ^ self perform: key asMutator with: anObject ].
  ^ super dynamicInstVarAt: key put: anObject