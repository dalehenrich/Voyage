serialization
serialize: aWrapperOrObject using: wireSerializer
  "  ^ (result dynamicInstVarAt: #'_wrapper')
    ifNil: [ self objectSerializer toString: result ]
    ifNotNil: [ :wrapper | self objectSerializer toString: wrapper ]"

  aWrapperOrObject isVoyageRoot
    ifFalse: [ ^ wireSerializer toString: aWrapperOrObject ].
  ^ self newSerializer
    serialize: aWrapperOrObject
    id: (aWrapperOrObject dynamicInstVarAt: #'_wrapper') _id
    using: wireSerializer