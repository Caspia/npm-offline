FROM verdaccio/verdaccio:3.2.0

MAINTAINER R Kent James <rkent@caspia.org>
LABEL Description="NPM offline repository demo using verdaccio" Version="3.2.0"

# copy the configuration files usable ib both offline and online environments
COPY ./configOffline.yaml /usr/local/app/configOffline.yaml
COPY ./configOnline.yaml /usr/local/app/configOnline.yaml

# copy the modified storage.js into the js running location
COPY ./storage.modified.js /usr/local/app/src/lib/storage.js

# add the minimal verdaccio cache, typically only used in testing
ADD --chown=100:101 verdaccio.tar.gz /verdaccio/storage

# This is usally overridden in up.sh
ENV CONFIGFILE configOffline.yaml
CMD $APPDIR/bin/verdaccio --config /usr/local/app/$CONFIGFILE --listen $PROTOCOL://0.0.0.0:${PORT}
