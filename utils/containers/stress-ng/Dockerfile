FROM quay.io/centos/centos:stream9

LABEL at.stderr.image.authors="toni@stderr.at" \
    version=0.1

ENV APP_ROOT=/opt/app-root

RUN dnf -y install 'dnf-command(config-manager)' && \
    dnf config-manager --set-enabled crb && \
    dnf -y install \
    https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm \
    https://dl.fedoraproject.org/pub/epel/epel-next-release-latest-9.noarch.rpm && \
    dnf -y install stress-ng && \
    dnf -y clean all


RUN mkdir -p ${APP_ROOT} && \
    chgrp -R 0 ${APP_ROOT} && \
    chmod -R g=u ${APP_ROOT} /etc/passwd

USER 10001
WORKDIR ${APP_ROOT}

ENTRYPOINT ["/usr/bin/stress-ng"]
