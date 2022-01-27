%dw 2.0
output application/java  
---
"Bearer " ++ payload."access_token"