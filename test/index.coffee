squeek = require '../lib'	
util = require 'util'	

q = squeek.and
	klicCoJe: is: 'tojeISovan'
	klicCoNeni: isnt: 'aTutoNe'
	pole: in: [1,2,3,4]
	strpole: notin: ['a','b']
	or:
		a: is: 'b'
		c: gt: 10

console.log q.toSQL()

transportObject = q.getQuery()
console.log squeek.fromQuery(transportObject).toSQL()