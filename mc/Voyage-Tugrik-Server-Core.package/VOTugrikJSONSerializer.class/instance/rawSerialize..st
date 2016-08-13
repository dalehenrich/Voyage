serializing
rawSerialize: anObject
  | future jsonDictionary aDescription oldObject oldJSON |
  future := self futureClass realObject: anObject id: nil.
  futures add: future.
  aDescription := self descriptionFor: anObject.
  anObject isTypeForbidden
    ifTrue: [ VOForbiddenError signal: anObject className ].
  jsonDictionary := self rawSerialize: anObject description: aDescription.
  future serialized: jsonDictionary.
  ^ futures