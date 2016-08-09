serializing
serialize: anObject description: aDescription id: anOID
  | future |
  future := self futureClass realObject: anObject id: anOID.
  futures add: future.
  self basicSerialize: anObject description: aDescription.
  ^ futures