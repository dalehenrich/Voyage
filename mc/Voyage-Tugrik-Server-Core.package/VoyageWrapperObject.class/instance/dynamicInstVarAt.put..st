accessing
dynamicInstVarAt: key put: anObject
  key == #'_id'
    ifTrue: [ 
      self _id: anObject.
      ^ anObject ].
  (self _obj class allInstVarNames includes: key)
    ifTrue: [ ^ self _obj instVarNamed: key put: anObject ].
  ^ self _obj dynamicInstVarAt: key put: anObject