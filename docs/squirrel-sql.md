# [Squirrel SQL](http://www.squirrelsql.org/)

## Sybase

https://blogs.sap.com/2016/06/28/how-to-configure-squirrel-to-use-it-with-sap-ase/

### [How to connect Sybase database through Squirrel](https://sourceforge.net/p/squirrel-sql/mailman/message/23260546/)

> While the jdbc-odbc bridge will provide minimal support, a better
> alternative is to
> use the jdbc driver provided by Sybase, or the JTDS driver
> (http://jtds.sourceforge.net/)
> The Sybase Adaptive Server Enterprise (ASE) driver class that I use is :
> 
> com.sybase.jdbc3.jdbc.SybDriver
> 
> and it is located in jconn3.jar (which you can find on your server in
> $SYBROOT/classed/jconn3.jar.
> 
> It's jdbc url looks like:
> 
> jdbc:sybase:Tds:<hostname>:<port>/<databasename>
> 
> The jTDS driver has a URL of the following form:
> 
> jdbc:jtds:<server_type>://<server>[:<port>][/<database>]
> 
> My Sybase server version is:
> 
> Adaptive Server Enterprise/15.0.2/EBF 15654 ESD#4/P/Linux Intel/Linux
> 2.4.21-47.ELsmp i686/ase1502/2528/32-bit/FBO/Sat Apr  5 05:18:42 2008
> 

