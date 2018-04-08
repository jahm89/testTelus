Applications to take control donations,
register new users

Prerequisites
JDK 1.7 or later
Maven 3 or later

The readme is done to use eclipse as IDE

## STEPS TO RUN ##

(I use eclipse as my IDE but you can choice)

1. Clone or download ZIP (if download as ZIP you may uncompress it)

2. Restore database from file database.sql it's in root, the name database: test_donation

3. configure file "application.properties" path : src/main/resources

	** change URL database spring.datasource.url
	** change user and password 

4. import project maven in eclipse

5. If you have configured eclipse or netnbeans to run project's spring boot, just may use boot dashboard and run the project

If you don't have configured eclipse with boot spring, run the project like maven project:
	
	** rigth click over project -> maven -> update project
	** then run the project: rigth click over project -> run as -> spring boot app
	

you may access to location server and port, usually is: http://localhost:8080/
and that't it you can show the Application


You don't need some library external because all dependencies are in pom.xml

## OUTPUTS ##
1. Entity Relationship diagram, in root location, as ERR diagram open with mysql WorkBench Or see the image ERRDiagram
2. Database Scripts.  in root application file: database.sql
3. Web application to manage online donations. source src
4. Web service to provide information to external resources. The file name must be servicexxx File is generated in root application
	every time to send the request to web service:
	
  URL to web service: http://URLServer/getControlDonations 
  example: http://localhost:8080/getControlDonations
  
  You can see the data at output, but also You will see the file at root name "servicexxx.txt"
  

5. Visitor counter registered in a txt file, different row for each day and showing in application main page.
	Every time that any user enter to application the file is update, create new line to every day.
	
	name file "CounterVist.txt" at root application (The file is created automatically)
	

