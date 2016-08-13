visiting
visitToOneDescription: aDescription
  (aDescription accessor read: self object)
    ifNotNil: [ :element | self rawSerialize: element description: aDescription ]