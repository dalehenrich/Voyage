serialization
serializeRootObjectResult: anObject
  "Objects that are persisted with Voyage will have a _wrapper dynamic inst var"

  | futures |
  [ 
  futures := anObject isTypeWrapper
    ifTrue: [ 
      "direct return of wrapper"
      self newSerializer
        serialize: anObject _obj
        id:
          (anObject _obj dynamicInstVarAt: VOTugrikJSONSerializer fieldWrapperSymbol) _id ]
    ifFalse: [ 
      anObject isTypePersistent
        ifTrue: [ 
          "direct return of a root object"
          self newSerializer
            serialize: anObject
            id:
              (anObject dynamicInstVarAt: VOTugrikJSONSerializer fieldWrapperSymbol) _id ]
        ifFalse: [ 
          "return of an object, that may contain references to root objects"
          self newSerializer rawSerialize: anObject ] ].
  futures size > 1
    ifTrue: [ 
      "should only serialize the object and embedded objects ... all other voyage roots should be turned into reference objects not futures"
      self halt ].
  ^ futures first serialized ]
    on: Error
    do: [ :ex | self halt ]