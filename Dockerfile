FROM jboss/wildfly
MAINTAINER Dario Alves Junior <darioajr@gmail.com>

# Fix security issues
ENV JAVA_OPTS $JAVA_OPTS -Dsun.security.ssl.allowUnsafeRenegotiation=false -Dsun.security.ssl.allowLegacyHelloMessages=false -Dsun.security.ssl.allowUnsafeLegacyRenegotiation=false -Dorg.apache.coyote.http11.Http11Protocol.MAX_KEEP_ALIVE_REQUEST=1 -Djdk.tls.rejectClientInitializedRenego=true -Djdk.tls.rejectClientInitiatedRenegotiation=true"

# Off welcome page
CMD sed -i 's/<location name="\/" handler="welcome-content"\/>//g' /opt/jboss/wildfly/standalone/configuration/standalone.xml
CMD sed -i 's/<handlers>//g' /opt/jboss/wildfly/standalone/configuration/standalone.xml
CMD sed -i 's/<file name="welcome-content" path="${jboss.home.dir}\/welcome-content"\/>//g' /opt/jboss/wildfly/standalone/configuration/standalone.xml
CMD sed -i 's/<\/handlers>//g' /opt/jboss/wildfly/standalone/configuration/standalone.xml

# Remove info of webserver versions 
CMD sed -i 's/header-value="WildFly\/9"/header-value="Unknown"/g' /opt/jboss/wildfly/standalone/configuration/standalone.xml
CMD sed -i 's/header-value="X-Powered-By"/header-value="Unknown"/g' /opt/jboss/wildfly/standalone/configuration/standalone.xml

# Define default language
ENV JAVA_OPTS $JAVA_OPTS -Duser.language=en"

