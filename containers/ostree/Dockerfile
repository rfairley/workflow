FROM registry.fedoraproject.org/fedora:28

RUN dnf -y update && \
    dnf -y install @buildsys-build dnf-plugins-core --allowerasing && \
    dnf -y builddep ostree && \
    dnf clean all
