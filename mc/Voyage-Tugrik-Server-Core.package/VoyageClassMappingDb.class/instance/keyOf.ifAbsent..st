accessing
keyOf: anObject ifAbsent: absentBlock
  ^ (anObject dynamicInstVarAt: self fieldRootIdSymbol) ifNil: absentBlock