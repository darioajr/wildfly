FROM jboss/wildfly
MAINTAINER Dario Alves Junior <darioajr@gmail.com>

# Fix security issues
ENV JAVA_OPTS $JAVA_OPTS -Dsun.security.ssl.allowUnsafeRenegotiation=false -Dsun.security.ssl.allowLegacyHelloMessages=false -Dsun.security.ssl.allowUnsafeLegacyRenegotiation=false -Dorg.apache.coyote.http11.Http11Protocol.MAX_KEEP_ALIVE_REQUEST=1 -Djdk.tls.rejectClientInitializedRenego=true -Djdk.tls.rejectClientInitiatedRenegotiation=true"

# Define default language
ENV JAVA_OPTS $JAVA_OPTS -Duser.language=en"
