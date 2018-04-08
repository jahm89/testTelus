Applications to take control donations,
register new users

Prerequisites
JDK 1.7 or later
Maven 3 or later

The readme is done to use eclipse as IDE

## STEPS TO RUN ##

(I use eclipse as my IDE but you can choice)

1. Clone or download ZIP (if download as ZIP you may uncompress it)

2. Restore database from file database.sql it's in root

3. configure file "application.properties" path : src/main/resources

	** change URL database spring.datasource.url
	** change user and password 

4. import project maven in eclipse

5. If you have configured eclipse or netnbeans to run project's spring boot, just may use boot dashboard and run the project

If you don't have configured eclipse with boot spring, run the project like maven project:
	
	** rigth click over project -> maven -> update project
	** then run the project: rigth click over project -> run as -> spring boot app
	

you may access to location server and port, usually is: localhost:8080/
and that't it you can show the Application


You don't need some library external because all dependencies are in pom.xml
