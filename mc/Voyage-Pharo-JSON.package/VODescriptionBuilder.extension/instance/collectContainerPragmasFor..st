*Voyage-Pharo-JSON
collectContainerPragmasFor: aClass
	^ aClass isMeta
		ifTrue: [ self collectContainerPragmasFrom: Metaclass to: Behavior ]
		ifFalse: [ self collectContainerPragmasFrom: aClass theMetaClass to: Class ]