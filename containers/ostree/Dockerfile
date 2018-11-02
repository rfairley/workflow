# this pulls the fedora 28 image
FROM registry.fedoraproject.org/fedora:28

# install ostree dependencies
RUN dnf update -y && \
    dnf -y install @buildsys-build dnf-plugins-core  --allowerasing && \
    dnf -y builddep ostree  && \
    dnf clean all
