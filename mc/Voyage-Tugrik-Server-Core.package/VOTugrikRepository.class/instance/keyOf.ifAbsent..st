accessing
keyOf: anObject ifAbsent: absentBlock
  ^ (anObject dynamicInstVarAt: self db fieldRootIdSymbol) ifNil: absentBlock