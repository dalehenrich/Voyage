instance creation
dbServerClassName: dbServerClassName database: databaseString
  ^ self new
    databaseName: databaseString;
    dbServerClassName: dbServerClassName;
    yourself