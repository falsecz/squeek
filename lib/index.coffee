util = require 'util'

operators =
	is: "=="
	isnt: "!="
	gt: ">"
	gte: ">="
	lt: "<"
	lte: "<="

class Query
	
	constructor: (operator, query) ->
		@query = {}
		@query[operator] = query

	parse: (operator, val) ->
		arr = []
		
		for a, b of val
			x = {}
			x[a] = b
			arr.push "(" + @parseNode(x) + ")"

		arr.join ' ' + operator + ' '

	parseNode: (node)=>
		unless typeof node is 'object'
			return '"' + node + '"'
		
		out = []
		
		for key, val of node
			if key in ['and', 'or']
				out.push @parse key, val
			else
				if operators[key]
					mark = operators[key] + " "
				else 
					mark = key + " "
				out.push mark + @parseNode(val)

		out.join ' '

	toSQL: =>
		@parseNode(@query)
			

module.exports.and = (opts) ->
	new Query 'and', opts
module.exports.or = (opts) ->
	new Query 'or', opts
	 
	 