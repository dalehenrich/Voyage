serialization
serializeRootObject: anObject
  "Objects that are persisted with Voyage will have a _wrapper dynamic inst var"

  | futures |
  (anObject isTypeWrapper not and: [ anObject isTypePersistent not ])
    ifTrue: [ ^ anObject ].
  futures := self newSerializer
    serialize: anObject
    id:
      (anObject dynamicInstVarAt: VOTugrikJSONSerializer fieldWrapperSymbol) _id.
  futures size > 1
    ifTrue: [ 
      "should only serialize the object and embedded objects ... all other voyage roots should be turned into reference objects not futures"
      self halt ].
  ^ futures first serialized