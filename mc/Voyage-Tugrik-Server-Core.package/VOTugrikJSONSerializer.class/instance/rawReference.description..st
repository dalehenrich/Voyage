private raw
rawReference: anObject description: aDescription
  "by definition, all of the objects being serialized in GemStone are already persisted, so we just need to insert a reference to other root objects"

  | jsonDictionary |
  jsonDictionary := self referenceToDictionary: anObject.
  aDescription hasKind
    ifTrue: [ jsonDictionary removeKey: self class fieldType ifAbsent: [  ] ].
  ^ jsonDictionary