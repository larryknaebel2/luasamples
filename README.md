# luasamples 

The lua binaries are included in this repository.

```
PS > bin\lua -v
Lua 5.1.5  Copyright (C) 1994-2012 Lua.org, PUC-Rio
```

A lua script can be executed like this :

```
bin\lua helloworld.lua
```


Interactive mode can be executed using :

```
bin\lua
```

```
PS > bin\lua -help
usage: bin\lua.exe [options] [script [args]].
Available options are:
  -e stat  execute string 'stat'
  -l name  require library 'name'
  -i       enter interactive mode after executing 'script'
  -v       show version information
  --       stop handling options
  -        execute stdin and stop handling options
  
```