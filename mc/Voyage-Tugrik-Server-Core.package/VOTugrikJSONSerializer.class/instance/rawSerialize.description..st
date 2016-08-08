private raw
rawSerialize: rawValue description: aDescription
  rawValue isTypeWrapper
    ifTrue: [ ^ self rawWrapper: rawValue description: aDescription ].
  ^ super rawSerialize: rawValue description: aDescription