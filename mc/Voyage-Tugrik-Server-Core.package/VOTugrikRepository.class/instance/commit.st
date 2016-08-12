transactions
commit
  | conflicts |
  [ System commit ]
    on: TransactionError
    do: [ :ex | 
      "record transactionConflicts do developer can debug the problem on client"
      conflicts := System transactionConflicts.
      ex pass ]