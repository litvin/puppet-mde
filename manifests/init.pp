# Class: mde
# ===========================
#
# Full description of class mde here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
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
#    class { 'mde':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2018 Your name here, unless otherwise noted.
#

class mde (

 Array[String] $package_name       = $::mde::params::package_name,
 Array[String] $package_name_wget  = $::mde::params::package_name_wget,
 Array[String] $package_name_local = $::mde::params::package_name_wget,
 String $package_ensure            = $::mde::params::package_ensure,
 String $domain_name               = $::mde::params::domain_name,
 String $host_ad_name              = $::mde::params::host_ad_name,

) inherits ::mde::params {

  class { '::mde::downloads': }
  -> class { '::mde::install': }
  -> class { '::mde::realm': }

}
