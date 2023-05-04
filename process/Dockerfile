FROM alpine:3.17.3
LABEL org.label-schema.schema-version="1.0" \
  org.label-schema.name="ovh-storage" \
  org.label-schema.description="OVHcloud storage demo" \
  org.label-schema.vcs-url="https://github.com/altoviz/ovh-storage"
LABEL maintainer="Alex Danvy <alex.danvy@altoviz.com>"
# coreutils needed for date compatibility vs busybox
RUN apk add --no-cache coreutils bash unzip grep curl zip
# rclone for S3/OVH
RUN curl https://rclone.org/install.sh | bash

ADD ./usr_local_bin/ /usr/local/bin/
ADD ./tmp/ /tmp/
RUN chmod +x /usr/local/bin/*.sh
ADD ./config/ /root/.config/

WORKDIR /
ARG OVH_S3_ACCESS_KEY_ID
ARG OVH_S3_SECRET_ACCESS_KEY
ARG OVH_S3_REGION
ARG OVH_S3_BUCKET

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
