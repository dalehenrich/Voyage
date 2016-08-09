private
keyOf: anObject
  | wrapper |
  wrapper := (anObject dynamicInstVarAt: self class fieldWrapperSymbol)
    ifNil: [ VOError signal: 'Invalid reference' ].
  ^ wrapper _id