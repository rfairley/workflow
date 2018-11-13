FROM registry.fedoraproject.org/fedora:28

RUN dnf install -y 'dnf-command(config-manager)' && \
    dnf config-manager --add-repo http://download.devel.redhat.com/rel-eng/internal/rcm-tools-fedora.repo && \
    dnf config-manager --set-enabled rcm-tools-fedora-rpms && \
    dnf install -y rpm-build rpm-devel rpmlint bash coreutils tree diffutils patch rpmdevtools brewkoji rhpkg --allowerasing

