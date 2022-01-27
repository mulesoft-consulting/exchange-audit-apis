%dw 2.0
output application/java
---
{
	endpoint: sizeOf(payload),
	method: sum(payload.numberOfMethods)
}
