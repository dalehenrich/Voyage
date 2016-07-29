accessing
dbServerClassName
  ^ dbServerClassName ifNil: [ TugrikDbServer name asString ]