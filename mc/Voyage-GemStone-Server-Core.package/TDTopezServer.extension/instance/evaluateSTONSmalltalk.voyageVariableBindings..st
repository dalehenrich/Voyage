*voyage-gemstone-server-core
evaluateSTONSmalltalk: smalltalkSource voyageVariableBindings: voyageVariableBindingsSTONString
  | result variableBindings voyageVariableBindings |
  voyageVariableBindings := self objectSerializer
    fromString: voyageVariableBindingsSTONString.
  variableBindings := Dictionary new.
  voyageVariableBindings
    keysAndValuesDo: [ :key :obj | 
      | voyageObj |
      voyageObj := VoyageClassMappingDbCollection
        createTugrikObjectFrom: obj
        ifNew: [ :ignored |  ].
      variableBindings at: key put: voyageObj ].
  result := self
    evaluateSmalltalk: smalltalkSource
    variableBindings: variableBindings.
  ^ self objectSerializer toString: result