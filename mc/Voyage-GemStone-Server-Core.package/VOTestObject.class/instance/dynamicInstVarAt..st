accessing
dynamicInstVarAt: key
  (self class allInstVarNames includes: key)
    ifTrue: [ ^ self perform: key ].
  ^ super dynamicInstVarAt: key