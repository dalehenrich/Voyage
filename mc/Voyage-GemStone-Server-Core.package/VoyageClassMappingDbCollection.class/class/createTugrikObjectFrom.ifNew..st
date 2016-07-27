utility
createTugrikObjectFrom: dict ifNew: newBlock
  | obj hasOid theOid query instanceClass |
  hasOid := false.
  dict
    at: '#instanceOf'
    ifAbsent: [ ^ super createTugrikObjectFrom: dict ]
    ifPresent: [ :instanceOf | 
      instanceClass := Smalltalk
        at: instanceOf
        ifAbsent: [ ^ super createTugrikObjectFrom: dict ] ].
  dict
    at: '_id'
    ifPresent: [ :oid | 
      hasOid := true.
      theOid := oid.
      obj := self objWithOid: oid ifAbsent: [  ] ].
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
          (key ~= '_id')
            ifTrue: [ obj dynamicInstVarAt: key asSymbol put: value ];
            yourself ].
      newBlock value: obj ].
  ^ obj