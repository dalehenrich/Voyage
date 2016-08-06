utility
createTugrikObjectFrom: dict dbCollection: aTugrikDbCollection ifNew: newBlock
  ^ self
    visitTugrikObjectFrom: dict
    dbCollection: aTugrikDbCollection
    ifNew: newBlock