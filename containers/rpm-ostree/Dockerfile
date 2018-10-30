# this pulls the fedora rawhide image
FROM registry.fedoraproject.org/fedora:rawhide

# install ostree dependencies
RUN dnf update -y --allowerasing && \
    dnf -y install @buildsys-build dnf-plugins-core --allowerasing && \
    dnf -y builddep rpm-ostree  && \
    dnf -y install --allowerasing ostree cargo python3-sphinx python3-devel \
                ostree-devel ostree-grub2 createrepo_c jq PyYAML \
                libubsan libasan libtsan elfutils fuse sudo python-gobject-base \
                selinux-policy-devel python2-createrepo_c \
                rpm-python parallel clang rsync ansible && \
    dnf clean all
