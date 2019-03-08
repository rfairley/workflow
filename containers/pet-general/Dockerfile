FROM registry.fedoraproject.org/fedora:29

WORKDIR /srv
COPY ./install-rpm-deps.sh /srv/
COPY ./install-go-deps.sh /srv/
RUN ./install-rpm-deps.sh
RUN ./install-go-deps.sh

