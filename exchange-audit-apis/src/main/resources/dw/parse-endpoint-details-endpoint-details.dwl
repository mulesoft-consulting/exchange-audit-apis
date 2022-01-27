%dw 2.0
output application/json skipNullOn = "everywhere"
import dw::utility
var payl = payload
fun replace (value) =
 payl map ((item, index) -> 
 if ( item.id == value ) item.method    else null
)
fun methodConverter(value) =
value.methodoperation."@id" map ((item, index) -> 
        replace (item)    )
---
{
	application: payload[0].appName,
	details: payload map ((item, index) -> 
	{
		endpoint: if ( isEmpty(item.methodoperation[0]."@id" ) ) null else item.methodpath,
		method: methodConverter(item)
	}
)
} utility::treeFilter ((value) -> 
    value match {
	case v is Array | Object | Null | ""   -> !isEmpty(v)
        else -> true
}) 