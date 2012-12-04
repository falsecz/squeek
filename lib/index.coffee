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

	escapeVal: (val) =>
		return val if typeof val is 'number'
		return '"' + val + '"'
		
	parseNode: (node)=>
		if node instanceof Array
			node = node.map (item) =>
				@escapeVal item
			
			return '(' + node.join(', ') + ')'
			
		# console.log typeof node
		unless typeof node is 'object'
			return @escapeVal node
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
		console.log util.inspect @query, no, 10, yes
		@parseNode(@query)
			

module.exports.and = (opts) ->
	new Query 'and', opts
module.exports.or = (opts) ->
	new Query 'or', opts
	 
	 