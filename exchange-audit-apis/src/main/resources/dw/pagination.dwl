%dw 2.0
output application/json
---
{
	limitRecords: p("anypoint.auditLogs.limitRecords"),
    record : vars.offset.record + vars.offset.limitRecords	
}