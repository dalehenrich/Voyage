private building
buildContainer: aPragma in: aClass
  | description |
  description := aClass perform: aPragma method selector.
  description collectionName isEmptyOrNil
    ifTrue: [ description collectionName: (self collectionNameFor: aClass) ].
  ^ description