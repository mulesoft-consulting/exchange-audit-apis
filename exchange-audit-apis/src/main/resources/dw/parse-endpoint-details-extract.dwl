%dw 2.0
import dw::utility
output application/json  skipNullOn = "everywhere"
---
payload."@graph" map ((item, index) ->
{
	appName: if ( item."@type"[0] == "apiContract:WebAPI" ) item."core:name" else null,
	id: if ( (item."@type"[0] == "apiContract:WebAPI" or item."@type"[0] =="apiContract:EndPoint" or item."@type"[0] =="apiContract:Operation") and ((item."apiContract:path" default "" contains "health") != true) ) item."@id" else null,
	method: item."apiContract:method",
	methodpath: if ( item."apiContract:path" default "" contains "health" ) null else item."apiContract:path",
	methodoperation: if ( item."apiContract:path" default "" contains "health" ) null else item."apiContract:supportedOperation"
}) utility::treeFilter ((value) -> 
    value match {
	case v is Array | Object | Null | "" -> !isEmpty(v)
        else -> true
}) 

