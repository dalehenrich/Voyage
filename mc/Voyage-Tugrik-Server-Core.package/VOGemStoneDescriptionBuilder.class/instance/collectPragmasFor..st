private
collectPragmasFor: aClass
  ^ aClass isMeta
    ifTrue: [ self collectPragmasFrom: Metaclass3 to: Behavior ]
    ifFalse: [ self collectPragmasFrom: aClass theMetaClass to: Class ]