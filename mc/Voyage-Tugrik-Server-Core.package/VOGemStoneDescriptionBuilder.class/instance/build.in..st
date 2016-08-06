private building
build: aPragma in: aClass
  | description |
  description := aClass perform: aPragma method selector.
  ((description accessor isKindOf: MANullAccessor)
    and: [ description attributeName notNil ])
    ifTrue: [ description accessor: (self buildDirectAccessorFor: description attributeName) ].
  ^ description