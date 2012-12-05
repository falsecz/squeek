```coffee
squeek = require '../lib'  

q = squeek.and
	klicCoJe: is: 'tojeISovan'
	klicCoNeni: isnt: 'aTutoNe'
	pole: in: [1,2,3,4]
	strpole: notin: ['a','b']
	or:
		a: is: 'b'
		c: gt: 10

console.log q.toSQL()
```

```coffee
(klicCoJe == "tojeISovan") and (klicCoNeni != "aTutoNe") and (pole IN (1, 2, 3, 4)) and (strpole NOT IN ("a", "b")) and ((a == "b") or (c > 10))
```

Create query class
-----

- ```fromQuery({"and":{"a":{"is":10}}}) ```
- ```and({"a":{"is":10}})```
- ```or({"a":{"is":10}})```

Convert query class
-----
- ```toSQL()``` - get sql query
- ```getQuery``` - get query object
