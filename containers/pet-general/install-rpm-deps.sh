#!/bin/bash

set -xeo pipefail

use_internal=true

rcm_tools_repo_url="http://download.devel.redhat.com/rel-eng/internal/rcm-tools-fedora.repo"
rcm_tools_repo="rcm-tools-fedora-rpms"
pkg_install="dnf install -y --allowerasing"

install_internal_rcm_tools() {
	dnf config-manager --add-repo "${rcm_tools_repo_url}"
	dnf config-manager --set-enabled "${rcm_tools_repo}"
	${pkg_install} \
		brewkoji \
		rhpkg
}


# General

dnf update -y

# Dev dependencies
${pkg_install} \
	@buildsys-build \
	dnf-plugins-core \
	golang \
	git \
	rust \
        libblkid-devel # https://github.com/coreos/ignition/blob/master/doc/development.md#development

# RPM and other utils
${pkg_install} \
	rpm-build \
	rpm-devel \
	rpmlint \
	bash \
	coreutils \
	tree \
	diffutils \
	patch \
	rpmdevtools
if [ -n "${use_internal}" ]; then
	install_internal_rcm_tools
fi

# Project build dependencies

# This list gets updated according to
# projects I currently work on.

# Further installation may be needed, e.g.
# running ci/build.sh in rpm-ostree to get
# test dependencies as well.

dnf builddep -y \
	ostree \
	rpm-ostree \
	ignition \
	console-login-helper-messages \
	console-login-helper-messages-issuegen \
	console-login-helper-messages-motdgen \
	console-login-helper-messages-profile \
	mantle


dnf clean all

