accessing
dynamicInstVarAt: key
  key == #'_id'
    ifTrue: [ ^ self _id ].
  (self _obj class allInstVarNames includes: key)
    ifTrue: [ ^ self _obj instVarNamed: key ].
  ^ self _obj dynamicInstVarAt: key