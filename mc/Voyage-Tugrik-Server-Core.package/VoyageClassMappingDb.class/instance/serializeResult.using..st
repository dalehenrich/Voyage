serialization
serializeResult: anObject using: wireSerializer
  | serialized |
  serialized := self serializeRootObjectResult: anObject.
  ^ wireSerializer toString: serialized