private raw
rawWrapper: rawValue description: aDescription
  | jsonDictionary |
  jsonDictionary := jsonDictionary := self
    serialize: rawValue _obj
    description: aDescription.
  ^ jsonDictionary
    at: self class fieldRootId put: rawValue _id;
    at: self class fieldType put: rawValue _obj className;
    yourself