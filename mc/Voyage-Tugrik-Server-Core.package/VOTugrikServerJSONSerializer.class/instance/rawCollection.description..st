private raw
rawCollection: aCollection description: aDescription
  aCollection do: [ :each | self rawSerialize: each description: aDescription ]