private
keyOf: anObject
  ^ (anObject dynamicInstVarAt: self class fieldWrapperSymbol)
    ifNil: [ VOError signal: 'Invalid reference' ]