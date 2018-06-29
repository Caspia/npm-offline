FROM verdaccio/verdaccio:3.2.0

MAINTAINER R Kent James <rkent@caspia.org>
LABEL Description="NPM offline repository demo using verdaccio" Version="3.2.0"
COPY ./configOffline.yaml /usr/local/app/configOffline.yaml
COPY ./configOnline.yaml //usr/local/app/configOnline.yaml
COPY ./storage.modified.js /usr/local/app/src/lib/storage.js

# Comment out since we create this in docker-compose if used
#VOLUME ["/verdaccio/storage"]
ENV CONFIGFILE configOnline.yaml
CMD $APPDIR/bin/verdaccio --config /usr/local/app/$CONFIGFILE --listen $PROTOCOL://0.0.0.0:${PORT}
