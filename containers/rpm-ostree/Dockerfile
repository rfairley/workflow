FROM registry.fedoraproject.org/fedora

RUN dnf update -y --allowerasing && \
    dnf -y install @buildsys-build dnf-plugins-core --allowerasing && \
    dnf -y builddep rpm-ostree  && \
    dnf -y install --allowerasing ostree rsync ansible && \
    dnf clean all
