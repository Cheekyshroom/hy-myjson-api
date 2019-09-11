# hy-myjson-api
Exactly what it sounds like.
A command line tool, and small library for connecting to myjson (http://myjson.com/about)

# example usage
Create an empty blob:
```
./myjson.hy 
```

Create new a blob and set it:
```
./myjson.hy -set '{"Hello": "World."}'
```

Grab data from a blob:
```
./myjson.hy  -get -blob https://api.myjson.com/bins/1cc7ht -set '{"Hello": "World."}'
```
