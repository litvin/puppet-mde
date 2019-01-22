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
 String $suffix			   = $::mde::params::suffix,
 String $install_provider	   = $::mde::params::install_provider, 

 String $package_ensure            = $::mde::params::package_ensure,
 String $run_script_link 	   = $::mde::params::run_script_link,
 String $run_script_xdg 	   = $::mde::params::run_script_xdg,
 
 String $mount_username   	   = $mde::params::mount_username,
 #String $mount_password     	   = $role::workstation::topPassword,
 String $mount_password     	   = $mde::params::mount_password,
 String $mount_domain     	   = $mde::params::mount_domain,

 String $share_server_name	   = $mde::params::share_server_name,
 String $pub_name 	   	   = $mde::params::pub_name,
 String $mount_dir        	   = $mde::params::mount_dir,
 

) inherits ::mde::params {

  class { '::mde::downloads': }
  -> class { '::mde::install': }
  -> class { '::mde::link': }
  class { '::mde::mount': }

}
