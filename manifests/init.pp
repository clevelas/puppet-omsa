# Class: omsa
# ===========================
#
# Full description of class omsa here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `apt_key`
#  Hash containing the GPG key server and key id, as expected by
#  Puppetlabs apt module. Useful only if $manage_repo is true
#
# * `manage_repo`
#  Let this module manage the repositories for Dell OMSA installation
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'omsa':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Davide Ferrari <vide80@gmail.com>
#
# Copyright
# ---------
#
# Copyright 2016 Davide Ferrari, unless otherwise noted.
#
class omsa(
  $apt_key      = $::omsa::params::apt_key,
  $manage_repo  = true,
  $package_name = $::omsa::params::package_name,
) inherits omsa::params {


  if str2bool("${manage_repo}") {
    class { '::omsa::repo':
      before => Package[$package_name],
    }
  }

}