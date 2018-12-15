#!/bin/bash

set -xeo pipefail

# Install RPM dependencies for build container


use_internal=

rcm_tools_repo_url="http://download.devel.redhat.com/rel-eng/internal/rcm-tools-fedora.repo"
rcm_tools_repo="rcm-tools-fedora-rpms"
pkg_install="dnf install -y --allowerasing"

install_internal_rcm_tools() {
	dnf config-manager --add-repo "${rcm_tools_repo_url}"
	dnf config-manager --set-enabled "${rcm_tools_repo}"
	${pkg_install} \
		brewkoji
		rhpkg
}


# General

dnf update -y

${pkg_install} \
	@buildsys-build \
	dnf-plugins-core

# RPM build dependencies

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


# PAM dependencies

${pkg_install} \
	audit-libs-devel \
	autoconf \
	automake \
	bison \
	cracklib-devel \
	docbook-dtds \
	docbook-style-xsl \
	elinks \
	flex \
	gettext-devel \
	libdb-devel \
	libnsl2-devel \
	libselinux-devel \
	libtirpc-devel \
	libtool \
	libxslt \
	linuxdoc-tools


# Project build dependencies

# Further installation may be needed, e.g.
# running ci/build.sh in rpm-ostree to get
# test dependencies as well.

dnf builddep -y ostree
dnf builddep -y rpm-ostree
dnf builddep -y pam
dnf builddep -y systemd


dnf clean all
