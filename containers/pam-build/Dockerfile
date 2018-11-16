FROM registry.fedoraproject.org/fedora:28

RUN dnf upgrade -y && \
    dnf install -y @buildsys-build dnf-plugins-core && \
    dnf builddep -y pam && \
    dnf config-manager --add-repo http://download.devel.redhat.com/rel-eng/internal/rcm-tools-fedora.repo && \
    dnf config-manager --set-enabled rcm-tools-fedora-rpms && \
    dnf install -y rpm-build rpm-devel rpmlint bash coreutils tree diffutils patch rpmdevtools brewkoji rhpkg --allowerasing && \
    dnf install -y audit-libs-devel autoconf automake bison cracklib-devel docbook-dtds docbook-style-xsl elinks flex gettext-devel libdb-devel libnsl2-devel libselinux-devel libtirpc-devel libtool libxslt linuxdoc-tools --allowerasing && \
    dnf clean all
