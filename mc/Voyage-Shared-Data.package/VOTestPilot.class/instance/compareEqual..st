comparing
compareEqual: aPilot
  aPilot species = self species
    ifFalse: [ ^ false ].
  ^ aPilot name = self name