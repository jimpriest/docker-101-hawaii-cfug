<h1>This is running in Docker</h1>
<p>We're running via docker-compose</p>
<p><a href="http://localhost:8025" title="http://localhost:8025">Mailhog</a> - http://localhost:8025</p>
<p><a href="http://localhost:8080/CFIDE/administrator" title="http://localhost:8080/CFIDE/administrator/">CFAdmin</a> - http://localhost:8080/CFIDE/administrator/</p>
<h2><cfoutput>#Now()#</cfoutput></h2>
<hr>
<p>Sending mail to:  foo@localhost.com</p>

<cfmail to="foo@localhost.com" from="bar@localhost.com" subject="Mailhog Test">
  Sending email within Docker!
</cfmail>