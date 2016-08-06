object creation
createTugrikObjectFrom: dict dbCollection: aTugrikDbCollection ifNew: newBlock
  | wrapper hasOid theOid query instanceClass |
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
      wrapper := aTugrikDbCollection objWithOid: oid ifAbsent: [  ] ].
  wrapper
    ifNil: [ 
      | obj |
      wrapper := hasOid
        ifTrue: [ 
          VoyageWrapperObject basicNew
            _id: theOid;
            yourself ]
        ifFalse: [ VoyageWrapperObject new ].
      obj := instanceClass basicNew.
      wrapper _obj: obj.
      dict
        keysAndValuesDo: [ :key :value | 
          (key ~= self fieldRootId)
            ifTrue: [ wrapper dynamicInstVarAt: key asSymbol put: value ];
            yourself ].
      newBlock value: wrapper ].
  ^ wrapper