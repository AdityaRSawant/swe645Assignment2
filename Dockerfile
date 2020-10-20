FROM tomcat:9.0-jdk15

COPY SWE_645_Assignment_1.war /usr/local/tomcat/webapps/

EXPOSE 80

EXPOSE 8182

EXPOSE 8080
