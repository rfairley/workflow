FROM registry.fedoraproject.org/fedora

RUN dnf upgrade -y && \
    dnf install -y @buildsys-build dnf-plugins-core && \
    dnf builddep -y pam && \
    dnf clean all
