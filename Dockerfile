FROM inspectit/jboss:5
MAINTAINER info.inspectit@novatec-gmbh.de

ENV PROJECT_NAME dvdstore

#copy nessesary files and deploy dvdstore application
RUN mkdir -p /database/database

WORKDIR /opt

RUN wget -q ftp://ntftp.novatec-gmbh.de/inspectit/samples/sample-dvdstore/${PROJECT_NAME}.zip \
&& unzip ${PROJECT_NAME}.zip \
&& mv h2.jar /database/ \
&& ln -s /database/h2.jar /jboss-5.1.0.GA/server/default/lib/. \
&& mv dvdstore22.h2.db /database/database/ \
&& mv dvdstore22.trace.db /database/database/ \
&& mv dvdstore.ear /jboss-5.1.0.GA/server/default/deploy/ \
&& mv dvdstore-prod-ds.xml /jboss-5.1.0.GA/server/default/deploy/dvdstore-ds.xml \
&& rm -f ${PROJECT_NAME}.zip
