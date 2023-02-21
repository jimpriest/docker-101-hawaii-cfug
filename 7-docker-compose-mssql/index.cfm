<cfquery name="dockersql" datasource="azure">
	SELECT * FROM [master].[INFORMATION_SCHEMA].[TABLES]
</cfquery>


<h1>This is running in Docker</h1>
<p>We're running via docker-compose</p>
<p><a href="http://localhost:8025" title="http://localhost:8025">Mailhog</a> - http://localhost:8025</p>
<p><a href="http://localhost:8080/CFIDE/administrator" title="http://localhost:8080/CFIDE/administrator/">CFAdmin</a> - http://localhost:8080/CFIDE/administrator/</p>
<h2><cfoutput>#Now()#</cfoutput></h2>
<hr>
<h3>SQL Data</h3>
<cfdump var="#dockersql#" abort="false" format="html" label="dump - debugging">