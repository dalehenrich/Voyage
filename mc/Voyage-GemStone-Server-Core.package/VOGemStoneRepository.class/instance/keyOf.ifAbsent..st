accessing
keyOf: anObject ifAbsent: absentBlock
  ^ (anObject dynamicInstVarAt: #'_id') ifNil: absentBlock