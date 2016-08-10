private
collectContainerPragmasFor: aClass
  ^ aClass isMeta
    ifTrue: [ self collectContainerPragmasFrom: Metaclass3 to: Behavior ]
    ifFalse: [ self collectContainerPragmasFrom: aClass theMetaClass to: Class ]