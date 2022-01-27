%dw 2.0

output application/json
import dw::utility

fun layer (data) =
data map (item,idx) -> 
 		if (item.key == "API Layer") (item.value  reduce ($$ ++ $)) 
 		else null
 		
fun domain (data1) =
data1 map (item1,idx1) -> 
 		if (item1.key == "Domain") (item1.value reduce ($$ ++ $) )
 		else null
 		
fun renameKey(key: Key) = key match {
    case "sandboxAnypointId" -> "SANBOX"
    case "prodAnypointId" -> "PROD"

    else -> (key)
}
---
{
assetId: payload.assetId,
description: vars.asset.description,
label: joinBy(payload.labels," | "),
apiLayer: layer(payload.categories) reduce ($),
domain: domain(payload.categories) reduce ($$),

(vars.appInstances  map ((item, index) ->  
(renameKey(item.environmentId)):  item.endpointUri)   reduce ($ ++ $$) )

 
} utility::treeFilter ((value) -> 
    value match {
        case v is Array | Object | Null | ""   -> !isEmpty(v)
        else -> true
    }
) 