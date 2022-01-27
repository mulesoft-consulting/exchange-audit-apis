%dw 2.0
output application/json  
---
{
  username: p("secure::anypoint.login.username"),
  password: p("secure::anypoint.login.password")
}