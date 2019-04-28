# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
PATH="$HOME/.local/bin:$HOME/bin:$PATH"
PATH="$HOME/rfairley-installs/minishift-1.27.0-linux-amd64:$PATH"
PATH="$HOME/rfairley-installs/openshift-origin-server-v3.9.0-191fece-linux-64bit:$PATH"
PATH="$HOME/rfairley-scripts:$PATH"

export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

cosa_mkdir() {
    workdir="${1}"
    sudo mkdir "${workdir}"
    sudo setfacl -m u:1000:rwx "${workdir}"
    sudo setfacl -d -m u:1000:rwx "${workdir}"
    sudo chcon system_u:object_r:container_file_t:s0 "${workdir}"
}

cosa() {
    env | grep COREOS_ASSEMBLER
    set -x # so we can see what command gets run
    sudo podman run --rm -ti -v ${PWD}:/srv/ --userns=host --device /dev/kvm --name cosa \
               ${COREOS_ASSEMBLER_PRIVILEGED:+--privileged}                                          \
               ${COREOS_ASSEMBLER_CONFIG_GIT:+-v $COREOS_ASSEMBLER_CONFIG_GIT:/srv/src/config/:ro}   \
               ${COREOS_ASSEMBLER_GIT:+-v $COREOS_ASSEMBLER_GIT/src/:/usr/lib/coreos-assembler/:ro}  \
               ${COREOS_ASSEMBLER_CONTAINER_RUNTIME_ARGS}                                            \
               ${COREOS_ASSEMBLER_CONTAINER:-quay.io/coreos-assembler/coreos-assembler:latest} $@
    rc=$?; set +x; return $rc
}

# Notice that this command omits the --rm and renames the container `cosa-pet`. The container is also
# run from a locally-build image `localhost/cosa-test`. Use e.g. `cosa_local shell` to access a persistent
# pet container.
cosa_local() {
    env | grep COREOS_ASSEMBLER
    set -x # so we can see what command gets run
    sudo podman run -ti -v ${PWD}:/srv/ --userns=host --device /dev/kvm --name cosa-pet \
               ${COREOS_ASSEMBLER_PRIVILEGED:+--privileged}                                          \
               ${COREOS_ASSEMBLER_CONFIG_GIT:+-v $COREOS_ASSEMBLER_CONFIG_GIT:/srv/src/config/:ro}   \
               ${COREOS_ASSEMBLER_GIT:+-v $COREOS_ASSEMBLER_GIT/src/:/usr/lib/coreos-assembler/:ro}  \
               ${COREOS_ASSEMBLER_CONTAINER_RUNTIME_ARGS}                                            \
               ${COREOS_ASSEMBLER_CONTAINER:-localhost/cosa-test} $@
    rc=$?; set +x; return $rc
}

alias la="ls -a"
alias ll="ls -alZ"
alias lh="ls -lh"
