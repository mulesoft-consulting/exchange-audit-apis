%dw 2.0
output application/json
fun extra (details) =
details map ((item, index) ->
item reduce ($))
---
payload.details.method map ((item, index) ->  {
	assetId: payload.application,
	endpoint: payload.details.endpoint[index],
	method: joinBy(extra(item)," | "),
	numberOfMethods: sizeOf(payload.details.method[index])
})   
