examples
voyageServerBlocks01
  ^ '"You can execute code on the server with server blocks. Temps vars reference by server block are copied to the server: "

| x |
x := 4.
[3 + x] voyageDoOnServer.

"Errors in server code brings up a debugger on the server stack:"

[3 foo] voyageDoOnServer.
'