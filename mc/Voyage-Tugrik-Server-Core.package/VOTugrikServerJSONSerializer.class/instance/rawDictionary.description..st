private raw
rawDictionary: aDictionary description: aDescription
  aDictionary
    keysAndValuesDo: [ :key :value | 
      self rawSerialize: key description: aDescription.
      self rawSerialize: value description: aDescription ]