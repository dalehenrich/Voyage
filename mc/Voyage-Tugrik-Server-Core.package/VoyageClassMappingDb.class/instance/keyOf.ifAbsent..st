accessing
keyOf: anObject ifAbsent: absentBlock
  | wrapper |
  wrapper := (anObject dynamicInstVarAt: self fieldWrapperSymbol)
    ifNil: [ ^ absentBlock value ].
  ^ wrapper _id