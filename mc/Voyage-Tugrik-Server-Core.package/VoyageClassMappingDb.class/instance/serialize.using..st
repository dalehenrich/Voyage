serialization
serialize: anObject using: wireSerializer
  | serialized |
  serialized := anObject isCollection
    ifTrue: [ anObject collect: [ :each | self serializeRootObject: each ] ]
    ifFalse: [ self serializeRootObject: anObject ].
  ^ wireSerializer toString: serialized