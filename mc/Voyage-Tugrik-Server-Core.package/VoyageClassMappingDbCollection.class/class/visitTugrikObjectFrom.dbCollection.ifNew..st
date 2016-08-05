utility
visitTugrikObjectFrom: dict dbCollection: aTugrikDbCollection ifNew: newBlock
  | obj hasOid theOid query instanceClass |
  hasOid := false.
  dict
    at: self fieldType
    ifAbsent: [ 
      ^ super
        createTugrikObjectFrom: dict
        dbCollection: aTugrikDbCollection
        ifNew: newBlock ]
    ifPresent: [ :instanceOf | 
      instanceClass := Smalltalk
        at: instanceOf
        ifAbsent: [ 
          ^ super
            createTugrikObjectFrom: dict
            dbCollection: aTugrikDbCollection
            ifNew: newBlock ] ].
  dict
    at: self fieldRootId
    ifPresent: [ :oid | 
      hasOid := true.
      theOid := oid.
      obj := aTugrikDbCollection objWithOid: oid ifAbsent: [  ] ].
  obj
    ifNil: [ 
      obj := hasOid
        ifTrue: [ 
          instanceClass basicNew
            _id: theOid;
            yourself ]
        ifFalse: [ instanceClass new ].
      dict
        keysAndValuesDo: [ :key :value | 
          (key ~= self fieldRootId)
            ifTrue: [ obj dynamicInstVarAt: key asSymbol put: value ];
            yourself ].
      newBlock value: obj ].
  ^ obj