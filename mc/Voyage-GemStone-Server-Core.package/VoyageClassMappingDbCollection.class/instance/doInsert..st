queries
doInsert: dict
  | obj hasOid theOid query instanceClass |
  hasOid := false.
  dict
    at: '#instanceOf'
    ifAbsent: [ ^ super doInsert: dict ]
    ifPresent: [ :instanceOf | instanceClass := Smalltalk at: instanceOf ifAbsent: [ ^ super doInsert: dict ] ].
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
      self add: obj ]