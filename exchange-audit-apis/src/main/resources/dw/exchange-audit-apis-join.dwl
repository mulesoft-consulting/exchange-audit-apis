%dw 2.0
import * from dw::core::Arrays
output application/java
---
outerJoin(payload, vars.metadata, (payload) -> payload.assetId, (metadata) -> metadata.assetId)