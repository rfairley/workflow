#!/bin/bash

set -xeo pipefail

# Install RPM dependencies for build container


use_internal=

#rcm_tools_repo_url="http://download.devel.redhat.com/rel-eng/internal/rcm-tools-fedora.repo"
#rcm_tools_repo="rcm-tools-fedora-rpms"
pkg_install="yum install -y"

# TODO: support rcm tools later
#install_internal_rcm_tools() {
#	dnf config-manager --add-repo "${rcm_tools_repo_url}"
#	dnf config-manager --set-enabled "${rcm_tools_repo}"
#	${pkg_install} \
#		brewkoji
#		rhpkg
#}


# General

# yum update -y
# yum install epel-release -y
yum -y groupinstall "Development Tools" "Development Libraries"
${pkg_install} glib2-devel liblzma

#${pkg_install} \
#	@buildsys-build \
#	dnf-plugins-core

# RPM build dependencies

#${pkg_install} \
#	rpm-build \
#	rpm-devel \
#	rpmlint \
#	bash \
#	coreutils \
#	tree \
#	diffutils \
#	patch \
#	rpmdevtools

#if [ -n "${use_internal}" ]; then
#	install_internal_rcm_tools
#fi


# Project build dependencies

# Further installation may be needed, e.g.
# running ci/build.sh in rpm-ostree to get
# test dependencies as well.

# yum-builddep -y ostree
# yum-builddep -y rpm-ostree


# yum clean all

