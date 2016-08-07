materialization
retrieveClassOf: aClass json: aDictionary
  | retrievedClass |
  aDictionary
    at: self fieldType
    ifPresent: [ :type | 
      retrievedClass := Smalltalk at: type asSymbol.
      (retrievedClass = aClass
        or: [ retrievedClass inheritsFrom: aClass persistentClass ])
        ifFalse: [ 
          VOError
            signal:
              ('Bad object requested ({1} does not inherits from {2})'
                format:
                  {(retrievedClass name).
                  (aClass name)}) ] ].
  ^ retrievedClass ifNil: [ aClass ]