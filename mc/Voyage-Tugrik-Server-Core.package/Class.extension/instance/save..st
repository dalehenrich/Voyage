*voyage-tugrik-server-core
save: anObject
  self isVoyageRoot
    ifTrue: [ ^ self voyageRepository save: anObject ]
    ifFalse: [ ^ anObject ]