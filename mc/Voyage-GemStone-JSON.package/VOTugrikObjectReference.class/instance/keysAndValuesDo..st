ston
keysAndValuesDo: aBlock
  "Dictionary simulation --- STON treats this guy as a map"

  aBlock value: VoyageClassMappingDbCollection fieldRootId value: self objectId.
  aBlock value: VoyageClassMappingDbCollection fieldType value: self instanceOf.
  aBlock
    value: VoyageClassMappingDbCollection fieldCollection
    value: self collectionName