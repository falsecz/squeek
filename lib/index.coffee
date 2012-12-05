util = require 'util'

operators =
	is: "=="
	isnt: "!="
	gt: ">"
	gte: ">="
	lt: "<"
	lte: "<="
	in: "IN"
	notin: "NOT IN"
	

class Query
	constructor: (operator, query) ->
		@query = {}
		@query[operator] = query

	parse: (operator, val) ->
		r = []
		for a, b of val
			o = {}
			o[a] = b
			r.push "(#{@parseNode(o)})"
		r.join " #{operator} "

	escapeVal: (val) =>
		return val if typeof val is 'number'
		"\"#{val}\""
		
	parseNode: (node)=>
		if node instanceof Array
			node = node.map (item) =>
				@escapeVal item
			return "(#{node.join(', ')})"

		unless typeof node is 'object'
			return @escapeVal node
		
		out = []
		for key, val of node
			if key in ['and', 'or']
				out.push @parse key, val
			else
				if operators[key]
					mark = operators[key]
				else 
					mark = key
				out.push mark + " "+ @parseNode(val)
		out.join ' '

	toSQL: =>
		@parseNode(@query)

	getQuery: =>
		@query
			
module.exports.fromQuery = (o) ->
	return new Query operator, query for operator, query of o

module.exports.and = (opts) ->
	new Query 'and', opts

module.exports.or = (opts) ->
	new Query 'or', opts
	 
	 