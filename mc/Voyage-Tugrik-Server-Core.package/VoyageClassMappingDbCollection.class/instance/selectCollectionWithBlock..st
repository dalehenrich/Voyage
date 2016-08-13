queries
selectCollectionWithBlock: selectBlock
  ^ collection select: [ :wrapper | selectBlock value: wrapper _obj ]