squeek = require '../lib'	
	

q = squeek.and
	klicCoJe: is: 'tojeISovan'
	klicCoNeni: isnt: 'aTutoNe'
	pole: in: [1,2,3,4]
	strpole: in: ['a','b']
	or:
		a: is: 'b'
		c: gt: 10
	
# q.and mrdka: 'mi dela dobre'
# q.or stava: 'mi dela dobre'
# q.or hovna: 'mi delaj dobre'
# q.and xx: 'ssasa'
# 		
			
# q = squeek.and
# 	foo: is: 'bar'
# 	and:
# 		coo: ">": 'foobar'
# 		hoo: isnt: 'sdasd'
# 		xxx: ['asd', 'sds']
# 		bbgbgb: not: ['asd', 'sds']
# 			
# q.and 
# 	guma: 'chybi'
# 	
# q.or 
# 	enabled: yes
	
# console.log 
console.log q.toSQL()